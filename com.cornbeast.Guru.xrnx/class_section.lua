--====================================================--
-- Class: Section
--====================================================--

class 'Section'

  function Section:__init(tbl)
    self.name = tbl.name
    self.sysex_message_template = tbl.sysex_message_template

    --== Add chilren: Group ==--  
    self.children = {}
    for i, child in ipairs(tbl) do
      if (type(child) == "Group") then
        table.insert(self.children,child)
      end
    end
  end

  function Section:initialize(synth_definition, sysex_message_template)
    if (self.sysex_message_template == nil) then
      self.sysex_message_template = sysex_message_template
    end
    self.synth_definition = synth_definition 
    for i, child in ipairs(self.children) do
      child:initialize(self.synth_definition, self.sysex_message_template)
    end
  end  

  function Section:add_midi_mappings(replace_existing)
    for i, child in ipairs(self.children) do
      child:add_midi_mappings(replace_existing)
    end
  end

  function Section:send_midi()
    for i, child in ipairs(self.children) do
      child:send_midi()
    end   
  end

  --== Create user interface for Container ==--
  function Section:create_ui()
    local vb = self.synth_definition.view_builder

    local margin = 10
    local spacing = 5
    
    local columns = {
      vb:vertical_aligner {
        width = 365,
        height = "100%",
        spacing = 5
      },
      vb:vertical_aligner {
        width = 365,
        height = "100%",
        spacing = 5
      },
      vb:vertical_aligner {
        width = 365,
        height = "100%",
        spacing = 5
      }
    }
    
    --== Super-secret ninja-style column algorithm, patent pending: ==--
    
    local column_height = self.synth_definition.content_height
    local current_col = 1
    local col_height = 0
    local group = nil
    local group_height = 0
    local prev_group = nil
        
    for i, child in ipairs(self.children) do
      group = child:create_ui()
      group_height = group.height + 5
      if (col_height + group_height > column_height) then
        if (col_height < (column_height - 50)) then
          columns[current_col]:add_child(
            vb:column {
              height = column_height - col_height,
              width=365,
              style = "group"
            }
          )
        else
          prev_group:add_child(vb:space{height = (column_height - col_height)})
        end
        current_col = current_col+ 1
        col_height = 0
        if (current_col == 4) then
          break
        end
      end
      col_height = col_height + group_height
      columns[current_col]:add_child(group)
      prev_group = group
    end

    if (current_col < 4) then
      if (col_height < (column_height- 50)) then
        columns[current_col]:add_child(
          vb:column {
            height = column_height - col_height,
            width=365,
            style = "group"
          }
        )
      else
        prev_group:add_child(vb:space{height = (column_height - col_height)})
      end
    end
    
    while (current_col < 3) do
      current_col = current_col + 1
      columns[current_col]:add_child(
          vb:column {
            height = column_height,
            width=365,
            style = "group"
          }
        )
    end

    return vb:horizontal_aligner{
      width = "100%",
      height = "100%",
      spacing = 5,
      columns[1],
      columns[2],
      columns[3]
    }
  end
