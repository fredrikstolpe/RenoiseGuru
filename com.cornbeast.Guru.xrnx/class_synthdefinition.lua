--====================================================--
-- Class: SynthDefinition
--====================================================--

class 'SynthDefinition'

  --== Constructor ==--  
  function SynthDefinition:__init(tbl)
    self.id = tbl.id
    self.name = assert(tbl.name, "SynthDefinition.name is missing")
    self.author = tbl.author
    self.beta = tbl.beta
    self.delay_between_midi_messages = tbl.delay_between_midi_messages
    self.omit_nrpn_lsb = tbl.omit_nrpn_lsb
    self.sysex_message_template = tbl.sysex_message_template
    self.content_height = tbl.content_height
    self.parameters = {}
    
    if self.id == nil then
      self.id = nice_name(self.name)
    end

    if self.content_height == nil then self.content_height = 500 end
    if self.content_height > 800 then self.content_height = 800 end

    --== Add children: Section ==--  
    self.children = {}
    for i, child in ipairs(tbl) do
      if (type(child) == "Section") then
        table.insert(self.children,child)
      end
    end

    self.preferences = renoise.Document.create("SynthDefinition_preferences") {
      midi_in_device_name = "",
      midi_out_device_name = "",
      midi_in_channel = 1,
      midi_out_channel = 1,
      midi_device_id = 0,
      show_beta_dialog = true
    }

    self.patch_index = 1
    self.dialog_content = nil
    self.dialog = nil
    self.patches = {}
    self.patch_document = nil
    self.midi_mapping_prefix = nil
    self.guru = nil
    self.midi = nil    
    self.view_builder = renoise.ViewBuilder()
    self.has_changed = false
    self.is_loading = false
    self.is_updating_dropdown = false
    self.has_randomize_values = false
        
    self:initialize()
  end

  --== Set up reference to synth definition, create patch document, add midi mappings, set sysex message start ==--
  function SynthDefinition:initialize()
    self.patch_document = renoise.Document.create("Guru_patch"){
      synth_definition = self.name,
      name = "Init"
    }
    self.patch_index_document = renoise.Document.create("Guru_patch_index"){
      synth_definition = self.name,
      patch_names = renoise.Document.ObservableStringList(),
      patch_filenames = renoise.Document.ObservableStringList()
    }
    self.midi_mapping_prefix = "com.cornbeast.Guru:" .. self.id .. ":"
    for i, child in ipairs(self.children) do
      child:initialize(self, self.sysex_message_template)
    end
  end

  function SynthDefinition:add_midi_mappings(replace_existing)
    for i, child in ipairs(self.children) do
      child:add_midi_mappings(replace_existing)
    end
  end

  --== Check if any parameter has changed since patch was loaded/saved ==--
  function SynthDefinition:check_has_changed()
    return self.has_changed
  end

  function SynthDefinition:set_changed()
    if self.is_loading then
      return
    end
    if not self.has_changed then 
      self:mark_patch_dropdown() 
    end
    self.has_changed = true  
  end

  --== Reset has changed flags when loaded/saved ==--
  function SynthDefinition:reset_changed()
    self.has_changed = false
  end
  
  --== Launch the synth ==--  
  function SynthDefinition:launch(guru,init_patch_name,init_patch_filename)

    if (self.dialog_content == nil) then
      print("Create ui initially")
        
      self.guru = guru
  
      if self.guru.preferences.guru_working_folder.value == "" then
        alert("Please select a working folder where Guru will store preferences and patches")
        self.guru:show_settings_dialog()
      end

      self:load_preferences()
      self:init_midi()
      self:scan_patches()
      self:add_midi_mappings()

      if self.beta and self.preferences.show_beta_dialog.value == true then
        alert("Note: This synth definition is considered work in progress, which means it may be incomplete, \r\n" ..
        "buggy and incompatible with future versions...\r\n\r\n" ..
        "Please help out by completing it, and report any errors in the Renoise forums!")
        self.preferences.show_beta_dialog.value = false
        self:save_preferences()
      end
  
      self.dialog_content = self:create_ui()
  
      if init_patch_filename ~= nil then
        self.init_patch_filename = init_patch_filename
        renoise.tool().app_idle_observable:add_notifier(self, self.load_init_patch_filename)
      elseif init_patch_name ~= nil then
        self.init_patch_name = init_patch_name
        renoise.tool().app_idle_observable:add_notifier(self, self.load_init_patch_name)
      else
        local patch_found = false
        for k,v in sorted_pairs(self.patches) do
          print("setting def")
          patch_found = true
          self:load_patch(k)
          break
        end
        if not patch_found then
          self:send_midi()
        end
      end

    end

    if (self.dialog == nil) then
      print("Show dialog")
      local dialog_title = "Guru - " .. self.name
      if self.beta then dialog_title = dialog_title .. " [BETA]" end
      self.dialog = renoise.app():show_custom_dialog(dialog_title, self.dialog_content)
    else
      if not self.dialog.visible then
        print("Re-show dialog")
        local dialog_title = "Guru - " .. self.name
        if self.beta then dialog_title = dialog_title .. " [BETA]" end
        self.dialog = renoise.app():show_custom_dialog(dialog_title, self.dialog_content)
      end
    end    
  end

  --== These two notifiers are here because at startup when loading ==--
  --== a song Renoise wouldnt send midi because of too much work ==--
  function SynthDefinition:load_init_patch_filename()
    print("-- Idle load init patch filename")
    self:load_patch_file(self.init_patch_filename)
    self:show_temp_patch_dropdown(self.patch_document.name.value,self.init_patch_filename)
    self.has_changed = true
    renoise.tool().app_idle_observable:remove_notifier(self, self.load_init_patch_filename)
  end

  function SynthDefinition:load_init_patch_name()
    print("-- Idle load init patch name")
    self:select_patch_dropdown(self.init_patch_name)
    renoise.tool().app_idle_observable:remove_notifier(self, self.load_init_patch_name)
  end

  --== Init midi ==--  
  function SynthDefinition:init_midi()
    local midi_out_device = self.preferences.midi_out_device_name.value
    local midi_in_device = self.preferences.midi_in_device_name.value
    
    if midi_out_device == nil then
      midi_out_device = guru.preferences.midi_out_device_name.value
    end
  
    if midi_in_device == nil then
      midi_in_device = guru.preferences.midi_in_device_name.value
    end 
  
    self.midi = Midi(midi_in_device,midi_out_device, self.omit_nrpn_lsb)
    self.midi:set_midi_channel(self.preferences.midi_out_channel.value)
    self.midi:set_device_id(self.preferences.midi_device_id.value)
  end

  --== Load prefs for synth definition, midi channel etc ==--  
  function SynthDefinition:load_preferences()
    if self.guru.preferences.guru_working_folder.value ~= "" then
      local preferences_file_path = self.guru.preferences.guru_working_folder.value .. "preferences/" .. self.id .. ".xml"
      if io.exists(preferences_file_path) then 
        print("Loading prefs from file")
        self.preferences:load_from(preferences_file_path)
      else
        print("No prefs file")
      end
    end
  end

  --== Save prefs ==--
  function SynthDefinition:save_preferences()
    if self.guru.preferences.guru_working_folder.value == "" then
      alert("Please select a working folder where Guru will store preferences and patches")
      self.guru:show_settings_dialog()
    end

    if self.guru.preferences.guru_working_folder.value ~= "" then
      local preferences_folder_path = self.guru.preferences.guru_working_folder.value .. "preferences/" 
      local preferences_file_path = preferences_folder_path .. self.id .. ".xml"
      print("preferences_folder_path: " .. preferences_folder_path)
      print("preferences_file_path: " .. preferences_file_path)
      if not io.exists(preferences_folder_path) then 
        print("Creating prefs folder")
        os.mkdir(preferences_folder_path)
      end
      self.preferences:save_as(preferences_file_path)
    end
  end
  
  --== Scan savedpatches from directory ==--  
  function SynthDefinition:scan_patches()
    self.patches = {}
    if self.guru.preferences.guru_working_folder.value ~= "" then
      local patches_folder_path = self.guru.preferences.guru_working_folder.value .. "patches/" 
      local synth_definition_patches_path = patches_folder_path .. self.id .. "/"
      
      if not io.exists(patches_folder_path) then 
        print("Creating patches folder")
        os.mkdir(patches_folder_path)
      end
      
      if not io.exists(synth_definition_patches_path) then 
        print("Creating synth_definition_patches_path")
        os.mkdir(synth_definition_patches_path)
      end
   
      self.patches["[Init patch]"] = "init"
      for i,file_name in ipairs(os.filenames(synth_definition_patches_path, {"*.xml"})) do
        local patch =  renoise.Document.instantiate("Guru_patch")
        patch:load_from(synth_definition_patches_path .. file_name)
        --print("Adding patch: " .. patch.name.value .. " - " .. synth_definition_patches_path .. file_name)
        if self.patches[patch.name.value] == nil then
          self.patches[patch.name.value] = synth_definition_patches_path .. file_name
        else
          print("Skipping dupe patch")
        end
      end
    end
  end

  --== Create the ui ==--
  function SynthDefinition:create_ui()

    local vb = self.view_builder

    local col = vb:column {
      id = "dialog_content",
      style = "panel",
      width = 1105,
      margin = 10,
      spacing = 10,
        vb:text {
          width = "100%",
          align = "center",
          font = "big",
          text = self.name
        }
    }

    if(#self.children > 1) then

      local items = {}
  
      for i, child in ipairs(self.children) do
        assert(child.name, "All Sections must have a unique name")
        table.insert(items, child.name)
      end
  
      col:add_child(
        vb:horizontal_aligner {
          mode = "center",
          vb:switch {
            width = #self.children * 100,
            height = 20,
            items = items,
            notifier = function(index)
              local tab_id = "tab_" .. self.children[index].name
              for i, child in ipairs(self.children) do
                if (vb.views["tab_" .. child.name].visible) then
                  vb.views["tab_" .. child.name].visible = false
                end
              end
              vb.views[tab_id].visible = true
              vb.views.dialog_content:resize()
            end
          }
        }
      )
    end
    
    local first = true
    for i, child in ipairs(self.children) do
      local tab_id = "tab_"
      if child.name ~= nil then tab_id = tab_id .. child.name end
      col:add_child(vb:horizontal_aligner {
        id = tab_id,
        visible = first,
        width = 1105,
        height = self.content_height,
        child:create_ui()
      })
      first = false
    end

    local ui = vb:vertical_aligner{
      width = 1145,
      margin = 10,
      spacing = 10,
      self:settings_ui(),
      vb:column{
        style="border",
        margin=1,
      col
      }
    }     
    return ui
  end

  --== Send sysex for all parameters ==--    
  function SynthDefinition:send_midi()
    print("### synth def send midi")
    for k, param in pairs(self.parameters) do
      param:send_midi()
      if self.delay_between_midi_messages ~= nil then sleep(self.delay_between_midi_messages) end
    end
  end

  --== Load patch document ==--  
  function SynthDefinition:load_patch(name)
    -- Secret init patch handling
    if self.patches[name] == "init" then
      print("*** Load Init patch")
      self.is_loading = true
      self.patch_document["name"].value = "Init"
      for k, param in pairs(self.parameters) do
        param:document_value(param.default_value)
      end
      self.is_loading = false
      self:send_midi()
      self:reset_changed()
    else
      print("Load patch: " .. name .. " - " .. self.patches[name])
      self:load_patch_file(self.patches[name])
    end
  end

  --== Load patch document ==--  
  function SynthDefinition:load_patch_file(file_name)
    print("* Load patch file: " .. file_name)
    self.is_loading = true
    self.patch_document:load_from(file_name)
    if not self.is_updating_dropdown then
      for k,param in pairs(self.parameters) do
        param:document_value(self.patch_document[param.id].value)
        param:update_ui()
      end
      self.is_loading = false      
      self:send_midi()
    else
      print("* Updating dropdown - didnt send")
      self.is_loading = false
    end
    self:reset_changed()
  end

  --== Save patch document ==--  
  function SynthDefinition:save_patch()
    if self.guru.preferences.guru_working_folder.value == "" then
      alert("Please select a working folder where Guru will store preferences and patches")
      self.guru:show_settings_dialog()
    end
    
    if self.guru.preferences.guru_working_folder.value == "" then
      alert("No working folder - can not save!")
      return
    end
    
    local patch_name = prompt("Enter a name for the patch", self.patch_document.name.value)
    
    if patch_name ~= nil and patch_name ~= "" then

      if patch_name:find("*") or patch_name:find("%[") or patch_name:find("%]") then
        alert("Sorry, patches may not contain *,[ or ] :-)")
        patch_name = prompt("Enter a name for the patch", self.patch_document.name.value)
      end
      
      if patch_name ~= nil then
      
        if patch_name:find("*") or patch_name:find("%[") or patch_name:find("%]") then
          alert("Not saving :-P")
          return
        end
        
        --local patch_files = os.filenames(folder_path, {"*.xml"})
        for k,v in pairs(self.patches) do
          if k == patch_name then
            if not confirm("Do you want to overwrite the existing patch?") then
              return
            end
          end
        end
  
        local folder_path = self.guru.preferences.guru_working_folder.value .. "patches/" .. self.id .. "/"
        local filename = folder_path .. "/" .. self.id .. "_"  .. nice_name(patch_name) .. ".xml"
        self.patch_document.name.value = patch_name
        self.patch_document.synth_definition.value = self.name
        print(("Saving %s "):format(filename))
        self.patch_document:save_as(filename)
        self:reset_changed()
        self:refresh_patch_dropdown()
        
      end
      
    end
  end

  --== Settings UI, patch select, settings etc ==--    
  function SynthDefinition:settings_ui()
    local vb = self.view_builder

    return vb:row {
      style = "border",
      margin = 1,
      vb:row {
        style = "body",
        vb:horizontal_aligner {
          width = 1125,
          mode = "center",
          margin = 13,
          spacing = 10,
          vb:text {
            text = "Patch"
          },
          vb:popup {
            id = "popup_patches",
            width = 180,
            items = sorted_keys(self.patches),
            notifier = function(new_index)
              print("Notifier patch select changed")
              if (self:check_has_changed()) then
                local conf = confirm("The patch has been modified but not saved, are you sure you want to continue?")
                if not (conf) then
                  pcall(self.reselect_patch_dropdown,self)
                  return
                end
              end
              self:unmark_patch_dropdown()
              self.patch_index = new_index
              vb.views.popup_patches.value = new_index
              self:load_patch(vb.views.popup_patches.items[new_index])
            end            
          },
          vb:button {
            text = "Save...",
            width = 70,
            notifier = function()
              self:save_patch()
            end
          },
          vb:button {
            text = "Resend",
            width = 80,
            notifier = function()
              self:send_midi()
            end
          },
          vb:button {
            text = "Settings...",
            width = 80,
            notifier = function()
              self:show_settings_dialog()
            end
          },
          vb:button {
            text = "Randomize...",
            width = 80,
            notifier = function()
              self:show_randomize_dialog()
            end
          }
        }
      }
    }
  end
  
  --== Settings dialog ==--
  function SynthDefinition:show_settings_dialog()
    local vb = renoise.ViewBuilder()
  
    local selected_midi_in_device_index = 1
    for k,v in pairs(renoise.Midi.available_input_devices()) do
      if (self.preferences.midi_in_device_name.value == v) then
        selected_midi_in_device_index = k
      end
    end

    local selected_midi_out_device_index = 1
    for k,v in pairs(renoise.Midi.available_output_devices()) do
      if (self.preferences.midi_out_device_name.value == v) then
        selected_midi_out_device_index = k
      end
    end

    local dialog_content = vb:column {
      margin = 10,
      spacing = 5,
      vb:column {
        spacing = 5,
        vb:row {
          spacing = 5,
          vb:text {
            text = "MIDI in device",
            width = 110
          },
          vb:popup {
            id = "popup_midi_in",
            width = 180,
            value = selected_midi_in_device_index,
            items = renoise.Midi.available_input_devices(),
            notifier = function(new_index)
              self.preferences.midi_in_device_name.value = vb.views.popup_midi_in.items[new_index]
              self:save_preferences()
            end
          }
        },
        vb:row {    
          spacing = 5,
          vb:text {
            text = "MIDI out device",
            width = 110
          },
          vb:popup {
            id = "popup_midi_out",
            width = 180,
            value = selected_midi_out_device_index,
            items = renoise.Midi.available_output_devices(),
            notifier = function(new_index)
              local value = vb.views.popup_midi_out.items[new_index]
              self.midi:open_midi_out_device(value)
              self.preferences.midi_out_device_name.value = value
              self:save_preferences()
            end
          }
        },
        vb:row {
          spacing = 5,
          vb:text {
            text = "MIDI channel",
            width = 110
          },
          vb:popup {
            id = "popup_midi_channel",
            width = 180,
            value = self.preferences.midi_out_channel.value,
            items = {
              "Channel 1",
              "Channel 2",
              "Channel 3",
              "Channel 4",
              "Channel 5",
              "Channel 6",
              "Channel 7",
              "Channel 8",
              "Channel 9",
              "Channel 10",
              "Channel 11",
              "Channel 12",
              "Channel 13",
              "Channel 14",
              "Channel 15",
              "Channel 16"
            },
            notifier = function(new_index)
              self.preferences.midi_out_channel.value = new_index
              self.midi:set_midi_channel(new_index)
              self:save_preferences()
            end
          }          
        },
        vb:row {
          spacing = 5,
          vb:text {
            text = "Device id",
            width = 110
          },
          vb:valuefield{
            id = "valuefield_device_id",
            width = 180,
            min = 0,
            max = 126,
            value = self.preferences.midi_device_id.value,
            notifier = function(value)
              self.preferences.midi_device_id.value = value
              self.midi:set_device_id(value)
              self:save_preferences()
            end,
            tostring = function(value)
              return ("%.0f"):format(tostring(value))
            end,
            tonumber = function(value)
              local success, new_val = try_round(value)
              if (success) then
                value = new_val
                if (value < 0) then value = 0 end
                if (value > 126) then value = 126 end
                return value
              end
            end
          }
        }        
      }
    }
    renoise.app():show_custom_prompt("Settings - " .. self.name, dialog_content, {'Close'})
  end

  function SynthDefinition:show_randomize_dialog()
    local vb = renoise.ViewBuilder()
    
    local groups = {}
    for i, section in ipairs(self.children) do
      for j, group in ipairs(section.children) do
        if group.name ~= nil then
          groups[group.name] = group
        end
      end
    end

    local sorted_groups = sorted_keys(groups)
    table.insert(sorted_groups,1,"All")
    
    local dialog_content = vb:column {
      margin = 10,
      spacing = 5,
      vb:column {
        spacing = 5,
        vb:row {
          spacing = 5,
          vb:text {
            text = "Randomize group",
            width = 110
          },
          vb:popup {
            id = "popup_group",
            width = 180,
            items = sorted_groups,
            notifier = function(new_index)
            end
          }
        }
      }
    }
    local buttons = {'Randomize!','Cancel'}
    if self.has_randomize_values then
      buttons = {'Totally random!','A little less random','Cancel'}
    end
    
    local button = renoise.app():show_custom_prompt("Randomize", dialog_content, buttons)
    if button == "Randomize!" or button == "Totally random!" or button == "A little less random" then
      local moderately = false
      if button == "A little less random" then
        moderately = true
      end
      local group = nil
      local group_name = vb.views.popup_group.items[vb.views.popup_group.value]
      if group_name ~= "" then
        group = groups[group_name]
      end
      if group ~= nil then
        print("Randomize group params")
        for k, param in pairs(group.children) do
          self:randomize_parameter(param,moderately)
          if self.delay_between_midi_messages ~= nil then sleep(self.delay_between_midi_messages) end
        end
      else
        print("Randomize all params")
        for k, param in pairs(self.parameters) do
          self:randomize_parameter(param,moderately)
          if self.delay_between_midi_messages ~= nil then sleep(self.delay_between_midi_messages) end
        end
      end
    end
  end

  function SynthDefinition:randomize_parameter(param,moderately)
    local randomize_min = param.min_value
    local randomize_max = param.max_value 
    if (param.randomize_min ~= nil and moderately) then
      randomize_min = param.randomize_min
    end
    if (param.randomize_max ~= nil and moderately) then
      randomize_max = param.randomize_max
    end
    local random = math.floor(math.random()*(randomize_max-randomize_min)+randomize_min+0.5)
    param:document_value(random)
  end

  -- Dropdown handling ugly-style!
  
  --== Refresh patch files in folder ==--
  function SynthDefinition:refresh_patch_dropdown()
    local vb = self.view_builder
    self:scan_patches()
    vb.views.popup_patches.items = sorted_keys(self.patches)
    local selected_patch_index = 1
    for k,v in pairs(vb.views.popup_patches.items) do
      if (self.patch_document.name.value == v) then
        vb.views.popup_patches.value = k
        break
      end
    end    
  end

  --== Show the temporarily loaded patch to list with ** ==--
  function SynthDefinition:show_temp_patch_dropdown(patch_name,patch_filename)
    print("Show temp dd")
    local vb = self.view_builder
    patch_name = patch_name .. " **"
    self.patches[patch_name] = patch_filename
    vb.views.popup_patches.items = sorted_keys(self.patches)
    local selected_patch_index = 1
    self.is_updating_dropdown = true
    for k,v in pairs(vb.views.popup_patches.items) do
      if (patch_name == v) then
        vb.views.popup_patches.value = k
        break
      end
    end
    self.is_updating_dropdown = false
  end

  --== Mark * patch as changed ==--
  function SynthDefinition:mark_patch_dropdown()
    local vb = self.view_builder
    local patch_name = vb.views.popup_patches.items[vb.views.popup_patches.value]
    if patch_name:sub(string.len(patch_name)) == "*" then return end
    self.patches[patch_name .. " *"] = self.patches[patch_name]
    self.patches[patch_name] = nil
    patch_name = patch_name .. " *"
    vb.views.popup_patches.items = sorted_keys(self.patches)
  end

  --== Remove * ==--
  function SynthDefinition:unmark_patch_dropdown()
    local vb = self.view_builder
    local patch_name = self.patch_document.name.value
    if patch_name == "Init" then
      patch_name = "[Init patch]"
    end
    if self.patches[patch_name .. " *"] == nil then 
      return
    end
    self.patches[patch_name] = self.patches[patch_name .. " *"]
    self.patches[patch_name .. " *"] = nil
    vb.views.popup_patches.items = sorted_keys(self.patches)
  end

  --== Take back prev selection ==--
  function SynthDefinition:reselect_patch_dropdown()
    local vb = self.view_builder
    local patch_name = self.patch_document.name.value
    if patch_name == "Init" then
      patch_name = "[Init patch]"
    end
    for k,v in pairs(vb.views.popup_patches.items) do
      if (v == patch_name .. " *" or v == patch_name .. " **") then
        vb.views.popup_patches.value = k
        break
      end
    end
  end

  --== Select by name ==--
  function SynthDefinition:select_patch_dropdown(patch_name)
    print("select patch dd")
    local vb = self.view_builder
    for k,v in pairs(vb.views.popup_patches.items) do
      if (v == patch_name) then
        vb.views.popup_patches.value = k
        break
      end
    end
  end
  
