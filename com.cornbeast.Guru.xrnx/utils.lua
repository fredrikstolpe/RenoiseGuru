--== Quik n dirty sleep, the kind that makes the app sleep ==--
function sleep(milliseconds)
  local start_time = os.clock()
  local time_lapsed = 0
  while time_lapsed < milliseconds do
    time_lapsed = (os.clock() - start_time) * 1000
  end
end

--== Unique enough key ==--
function kinda_unique_key()
  local key = os.date("%Y%m%d%H%M%S")
  key = key .. "_" .. math.ceil(math.random()*1000000)
  return key
end

--== Returns a sorted table ==--
function sorted_pairs(t)
  local a = {}
  for n in pairs(t) do table.insert(a, n) end
  table.sort(a)
  local i = 0      -- iterator variable
  local iter = function ()   -- iterator function
    i = i + 1
    if a[i] == nil then return nil
    else return a[i], t[a[i]]
    end
  end
  return iter
end

--== Return the keys for a table, sorted ==--
function sorted_keys(t)
  local sk = {}
  local sp = sorted_pairs(t)
  for k,v in sp do
    table.insert(sk,k)
  end
  return sk
end

--== Removes spaces and special chars from a string ==--
function nice_name(str)
  if (str == nil) then return "" end
  str = string.gsub(str,"[ ]","_")
  str = string.gsub(str,"[^_A-Za-z0-9]","")
  return string.lower(str)
end

--== Safely try round any value, return success + value ==--
function try_round(value)
  local add05 = function(val)
    return val + 0.5
  end
  local status,val = pcall(add05,value)
  local status,val = pcall(math.floor, val)
  return status,val
end

--== Alert dialog ==--
function alert(message)
  local vb = renoise.ViewBuilder()
  local DIALOG_MARGIN = renoise.ViewBuilder.DEFAULT_DIALOG_MARGIN
  local CONTENT_SPACING = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING
  local dialog_content_alert = vb:column {
    margin = DIALOG_MARGIN,
    spacing = CONTENT_SPACING,
    vb:text {
      align = "center",
      width = 250,
      text = message
    }
  }
  renoise.app():show_custom_prompt("Alert", dialog_content_alert, {"OK"})
end

--== Confirm dialog ==--
function confirm(message)
  local vb = renoise.ViewBuilder()
  local DIALOG_MARGIN = renoise.ViewBuilder.DEFAULT_DIALOG_MARGIN
  local CONTENT_SPACING = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING
  local dialog_content_confirm = vb:column {
    margin = DIALOG_MARGIN,
    spacing = CONTENT_SPACING,
    vb:text {
      align = "center",
      width = 250,
      text = message
    }
  }
  local pressed_button = renoise.app():show_custom_prompt("Confirm", dialog_content_confirm, {"Yes","No"})
  return(pressed_button == "Yes")
end

--== Prompt dialog ==--
function prompt(message, default_value)
  local vb = renoise.ViewBuilder()
  local DIALOG_MARGIN = renoise.ViewBuilder.DEFAULT_DIALOG_MARGIN
  local CONTENT_SPACING = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING
  local dialog_content_prompt = vb:column {
    margin = DIALOG_MARGIN,
    spacing = CONTENT_SPACING,
    vb:text {
      align = "center",
      width = 250,
      text = message
    },
    vb:textfield{
      id = "textfield_patch_name",
      width = 250,
      value = default_value
    }
  }
  local pressed_button = renoise.app():show_custom_prompt("Prompt", dialog_content_prompt, {"OK","Cancel"})
  if pressed_button == "OK" then
    return vb.views.textfield_patch_name.value
  else
    return nil
  end
end

--== Just a little neat bitwise and that I'm not using right now... ==--
function numberInNumber(number,inNumber)
  return (bit.band(number,inNumber) == number)
end
