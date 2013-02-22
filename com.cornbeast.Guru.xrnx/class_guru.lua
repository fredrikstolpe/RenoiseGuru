--====================================================--
-- Class: Guru
--====================================================--

class 'Guru'

  function Guru:__init()
    self.synth_definitions = {}
    self.synths_launched = {}
    self.dialogs = {}
    self.preferences = renoise.Document.create("Guru_preferences") {
      midi_in_device_name = "",
      midi_out_device_name = "",
      midi_in_channel = 1,
      midi_out_channel = 1,
      synth_definitions = renoise.Document.ObservableStringList(),
      synth_definition_filenames = renoise.Document.ObservableStringList(),
      guru_working_folder = ""
    }
    renoise.tool().preferences = self.preferences
    self.synth_definition_folder_path = os.currentdir() .. "synthdefinitions/"
    self.song_settings = nil
    self:add_notifiers()
  end

  --== Add notifiers ==--
  function Guru:add_notifiers()
    if not renoise.tool().app_new_document_observable:has_notifier(self, self.notifier_new_song) then
      renoise.tool().app_new_document_observable:add_notifier(self, self.notifier_new_song)
    end
    if not renoise.tool().app_saved_document_observable:has_notifier(self, self.notifier_song_saved) then
      renoise.tool().app_saved_document_observable:add_notifier(self, self.notifier_song_saved)
    end
    if not renoise.tool().app_release_document_observable:has_notifier(self, self.notifier_song_closed) then
      renoise.tool().app_release_document_observable:add_notifier(self, self.notifier_song_closed)
    end
  end
 
  --== New song/song loaded - look for settings, launch stored synths ==--
  function Guru:notifier_new_song()
    if self.preferences.guru_working_folder.value ~= nil then
      local settings_folder_path = self.preferences.guru_working_folder.value .. "songsettings/"
      if not io.exists(settings_folder_path) then 
        os.mkdir(settings_folder_path) 
      end
      self.song_settings = SongToolSettings("com.cornbeast.Guru",settings_folder_path);
      if self.song_settings.settings ~= nil then
        for k,v in pairs(self.song_settings.settings) do
          local synth = self:launch_synth(v.file_name,v.patch_name,v.patch_file_name)
        end
      end
    end
  end
  
  --== Song saved - determine which synths to store with song and store them ==--
  function Guru:notifier_song_saved()
    print("-- notifier_song_saved")
    if self.song_settings.settings_key ~= nil then
      local settings = {}
      for synth_definition_file_name,synth_definition in pairs(self.synths_launched) do
        print("Checking synth: " .. synth_definition.name)
        for k,instrument in pairs(renoise.song().instruments) do
          if instrument.midi_output_properties.device_name ~= "" and instrument.midi_output_properties.channel == synth_definition.preferences.midi_out_channel.value then
            print("Instr had a midi device and midi channel matched synth - save this one")
            local patch_file_name = nil
            if synth_definition:check_has_changed() then
              print("Has changed save temp patch")
              patch_file_name = self.song_settings.folder_path .. kinda_unique_key() .. "_" ..synth_definition.id .. ".xml"
              synth_definition.patch_document:save_as(patch_file_name)
              synth_definition:reset_changed()
              synth_definition:refresh_patch_dropdown()
              synth_definition:show_temp_patch_dropdown(synth_definition.patch_document.name.value,patch_file_name)
            else
              synth_definition:refresh_patch_dropdown()
              print("Hasnt changed")
            end
            local patch_name = synth_definition.patch_document.name.value
            table.insert(settings,{synth_definition = synth_definition.name, file_name = synth_definition_file_name, patch_name = patch_name, patch_file_name = patch_file_name})
          end
        end
      end
      if settings ~= {} then
        print("Saving settings")
        rprint(settings)
        self.song_settings:save(settings)
      end
    end  
  end
  
  --== Song closed - close dialogs and clear synths ==--
  function Guru:notifier_song_closed()
    print("-- notifier_song_closed")
    for k,synth in pairs(self.synths_launched) do
      if (synth.dialog ~= nil and synth.dialog.visible) then
        synth.dialog:close()
      end
    end
    self.synths_launched = {}
  end
  
  --== Read synth definition files from directory, add to preferences ==--
  function Guru:scan_synth_definitions()
    local folder_path = self.synth_definition_folder_path
    local files = os.filenames(folder_path, {"*.lua"})
    
    --== Clear the definitions in the preferences ==--
    while #self.preferences.synth_definitions > 0 do
      self.preferences.synth_definitions:remove()
      self.preferences.synth_definition_filenames:remove()
    end
    
    for i,file_name in ipairs(files) do
      local synth_def = dofile(folder_path .. file_name)
      print("Found synth definition: " .. synth_def.name)
      self.preferences.synth_definitions:insert(synth_def.name)
      self.preferences.synth_definition_filenames:insert(file_name)
    end
  end

  --== Create the Guru tools menu ==--  
  function Guru:create_menu()
    self:add_menu_entry {
      name = "Main Menu:Tools:Guru:Settings...",
      invoke = function()
        self:show_settings_dialog()
      end
    }

    self:add_menu_entry {
      name = "Main Menu:Tools:Guru:Scan synth definitions",
      invoke = function()
        self:scan_synth_definitions()
        self:clear_menu()    
        self:create_menu()
      end
    }
    
    if (#self.preferences.synth_definitions == 0) then
      self:scan_synth_definitions()
    end
    
    local first = true
    for i = 1, #self.preferences.synth_definitions do
      local name = "Main Menu:Tools:Guru:" .. self.preferences.synth_definitions[i].value
      if (first) then 
        name = "---" .. name
        first = false
      end
      self:add_menu_entry {
        name = name,
        invoke = function()
          self:launch_synth(self.preferences.synth_definition_filenames[i].value)
        end 
      }
    end
  end

  --== Add an item to the Guru tools menu if it not exists ==--  
  function Guru:add_menu_entry(entry)
    if (renoise.tool():has_menu_entry(entry.name)) then
      renoise.tool():remove_menu_entry(entry.name)
    end
    renoise.tool():add_menu_entry(entry)
  end

  --== Clear the all the synths in preferences from Guru tools menu ==--  
  function Guru:clear_menu()
    for i = 1, #self.preferences.synth_definitions do
      local name = "Main Menu:Tools:Guru:" .. self.preferences.synth_definitions[i].value
      if (renoise.tool():has_menu_entry(name)) then
        renoise.tool():remove_menu_entry(name)
      end
    end    
  end

  --== Start up a synth ==--
  function Guru:launch_synth(file_path,init_patch_name,init_patch_filename)
    print("--- Launching synth:" .. file_path)
    if self.song_settings ~= nil and self.song_settings.settings == nil then
      self.song_settings:create_key()
    end

    local synth = nil
    if self.synths_launched[file_path] == nil then
      print("Reading synth definition file: " .. file_path)
      synth = dofile(self.synth_definition_folder_path .. file_path)
      self.synths_launched[file_path] = synth
    else
      print("Synth already launched, reusing it")
      synth = self.synths_launched[file_path]
    end
    
    if (synth.dialog ~= nil and synth.dialog.visible) then
      print("Dialog of first synth visible - create new instance")
      synth = dofile(self.synth_definition_folder_path .. file_path)
    end

    synth:launch(self,init_patch_name,init_patch_filename)
    return synth
  end
  
  --== Settings dialog ==--
  function Guru:show_settings_dialog()
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
            width = 200,
            value = selected_midi_in_device_index,
            items = renoise.Midi.available_input_devices(),
            notifier = function(new_index)
              self.preferences.midi_in_device_name.value = vb.views.popup_midi_in.items[new_index]
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
            width = 200,
            value = selected_midi_out_device_index,
            items = renoise.Midi.available_output_devices(),
            notifier = function(new_index)
              self.preferences.midi_out_device_name.value = vb.views.popup_midi_out.items[new_index]
            end
          }
        },
        vb:row {
          spacing = 5,
          vb:text {
            text = "Guru working folder",
            width = 110
          },
          vb:textfield {
            id = "textfield_working_folder",
            width = 200,
            bind = self.preferences.guru_working_folder
          },
          vb:button{
            text = "Select",
            width = 80,
            notifier = function()
              local folder_path =renoise.app():prompt_for_path("Select a folder to store settings and patches in")
              print(folder_path)
              if folder_path ~= "" then
                self.preferences.guru_working_folder.value = folder_path
              end
            end
          }
        }
      }
    }
    renoise.app():show_custom_prompt("Guru settings", dialog_content, {'Close'})
  end
