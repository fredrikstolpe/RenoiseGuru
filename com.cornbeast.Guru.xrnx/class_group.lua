--====================================================--
-- Class: Group
--====================================================--

class 'Group'

  function Group:__init(tbl)
    self.name = tbl.name
    self.sysex_message_template = tbl.sysex_message_template
    
    --== Add chilren: Parameter ==--  
    self.children = {}
    for i, child in ipairs(tbl) do
      if (type(child) == "Parameter") then
        table.insert(self.children,child)
      end
    end
  end

  function Group:initialize(synth_definition, sysex_message_template)
    if (self.sysex_message_template == nil) then
      self.sysex_message_template = sysex_message_template
    end
    self.synth_definition = synth_definition 
    for i, child in ipairs(self.children) do
      child:initialize(self.synth_definition, self.sysex_message_template)
    end
  end  

  function Group:add_midi_mappings(replace_existing)
    for i, child in ipairs(self.children) do
      child:add_midi_mappings(replace_existing)
    end
  end

  function Group:send_midi()
    for i, child in ipairs(self.children) do
      child:send_midi()
    end   
  end

  --== Create user interface for Container ==--
  function Group:create_ui()
    local vb = self.synth_definition.view_builder


    local ui = vb:column {
      style = "group",
      margin = 10,
      spacing = 5,
      vb:text{
        text = self.name,
        font = "big"
      }
    }
  
    for i, child in ipairs(self.children) do
      ui:add_child(child:create_ui())
    end

    return ui
  end
