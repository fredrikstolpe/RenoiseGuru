--====================================================--
-- Class: Midi
--====================================================--

--Todo: midi in

class 'Midi'

  function Midi:__init(midi_in_device_name,midi_out_device_name,omit_nrpn_lsb)
    self.midi_channel = 1
    self.midi_in_device = nil
    self.midi_in_device_name = midi_in_device_name
    self.midi_out_device = nil
    self.midi_out_device_name = midi_out_device_name
    self.device_id = 0
    self.omit_nrpn_lsb = omit_nrpn_lsb
    self:initialize()
  end
  
  function Midi:send_cc(number,value)
    local cc_start = 0xB0 + (self.midi_channel-1)
    --print(("¤ Sending CC: %s %s"):format(number, value))
    self:send({cc_start,number,value})
  end  

  function Midi:send_pitchbend(value)
    local msb_value = math.floor(value/128)
    local lsb_value = value-(msb_value*128)
    local pitchbend_start = 0xE0 + (self.midi_channel-1)
    --print(("¤ Sending pitchbend: %s %s %s"):format(value,lsb_value,msb_value))
    self:send({pitchbend_start,lsb_value,msb_value})
  end

  function Midi:send_sysex(message_template, number, value)
    if value == nil then return end
    local message = {}
    for k,v in pairs(message_template) do
      if v == "dd" then
        table.insert(message, self.device_id)
      elseif v == "cc" then
        table.insert(message, self.midi_channel-1)
      elseif v == "nn" then
        table.insert(message, number)
      elseif v == "vv" then
        if (value > 127) then
          local ms_nibble = math.floor(value/128)
          value = value - (ms_nibble*128)
          table.insert(message, ms_nibble)
          table.insert(message, value)
        else
          table.insert(message, value)
        end
      else
        table.insert(message, v)
      end
    end
    --print(("¤ Sending sysex: %s %s"):format(number,value))
    self:send(message)
  end

  function Midi:send_nrpn(number,value)
    local cc_start = 0xB0 + (self.midi_channel-1)
    local msb_number = math.floor(number/128)
    local lsb_number = number-(msb_number*128)
    --print(("¤ Sending NRPN: %s %s"):format(number,value))
    self:send({cc_start,99,msb_number})
    self:send({cc_start,98,lsb_number})
    if (self.omit_nrpn_lsb) then
      self:send({cc_start,6,value})
    else
      local msb_value = math.floor(value/128)
      local lsb_value = value-(msb_value*128)
      self:send({cc_start,6,msb_value})
      self:send({cc_start,38,lsb_value})
    end
  end
  
  function Midi:send(message_table)
    local message = ""
    for k,v in ipairs(message_table) do message = message .. " " .. v end
    --print("¤ Sending midi: " .. message)
    if (self.midi_out_device ~= nil) then
      self.midi_out_device:send(message_table)
    else
      print("¤ Could not send midi, no device")
    end
  end
  
  function Midi:set_midi_channel(midi_channel)
    self.midi_channel = midi_channel
  end
  
  function Midi:set_device_id(device_id)
    self.device_id = device_id
  end
  
  --== Init ==--
  function Midi:initialize()
    if not self:midi_out_device_exists(self.midi_out_device_name) then
      self.midi_out_device_name = self:get_default_midi_out_device_name()
    end
    self:open_midi_out_device(self.midi_out_device_name)
  end

  --== Check if midi out device exists ==--
  function Midi:midi_out_device_exists(device_name)
    if (device_name == nil or device_name == "") then return false end
    local ret = table.find(renoise.Midi.available_output_devices(),device_name) ~= nil
    if not ret then
      print(("¤ MIDI out did not exist: '%s'"):format(device_name))
    end
    return ret
  end

  --== Get first occurring midi out device ==--
  function Midi:get_default_midi_out_device_name()
    if (#renoise.Midi.available_output_devices() > 0) then
      print(("¤ MIDI out device defaulted to '%s'"):format(renoise.Midi.available_output_devices()[1]))
      return renoise.Midi.available_output_devices()[1]
    end
    return nil
  end
  
  --== Open/create up midi out device ==--
  function Midi:open_midi_out_device(device_name)
    if self:midi_out_device_exists(device_name) then
      if (self.midi_out_device ~= nil and self.midi_out_device.is_open) then
        print("¤ Closing open MIDI device")
        self.midi_out_device:close()
      end
      self.midi_out_device = renoise.Midi.create_output_device(device_name)
      print(("¤ Opened MIDI out device: '%s'"):format(device_name))
    end
    return nil
  end
