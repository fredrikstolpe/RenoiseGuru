--[[============================================================================

SongToolSettings
Class for saving settings for Renoise tools with songs.

Created 15 Apr 2012 by Cornbeast


Description: 
----------------------------------------------------------------

THIS DESCRIPTION IS NOT VALID ANYMORE :-)


By creating a SongToolSettings object and calling the .create() method, a unique 
key is added to the song comments. This key is used for saving and loading 
settings as files.

This is by design, to not clutter up the song, to make is user-readable and 
possible to transfer between computers for example.

The settings (that you assign to the .settings variable) can be a table 
containing primitive types which is serialized and saved to a file. The files
are stored in a folder that you have to supply when you create the object.

The settings are automatically saved when the song is saved, but this will 
only work if the key is present in the song prior to this, so .create() has 
be called or the song must already have a key if it was loaded.

The settings are automatically loaded when a new song is loaded. Optionally
you can supply a callback function when creating the object which is called 
when a new song is loaded or created. This is useful if you want your tool
to act on new songs, after any settings has been loaded.

If you save a song with a new filename, then there are two songs with the
same key in the comments pointing to the same file, and the first songs 
settings would be overwritten.

To prevent this, the filename of the song is stored with the settings file.
Upon saving a check is made if a file already exists. If so, and the 
filename in the existing file differs, the existing settings are saved
as a backup in the file. So the file will have two (or more) sets of 
settings for different filenames.

When the first song is loaded again, it discoveres that the last saved 
filename is different, then the backup of the settings stored away will 
be used. Also a new key is created so when the first song is saved again
it is saved with a new key.


Usage:
----------------------------------------------------------------

local sts = SongToolSettings("my.tool.id", "c:/temp/", myNewSongCallback) --Callback is optional

function myNewSongCallback()
  if sts.settings == nil then --No settings were saved with the song that was loaded
    sts:create() --Add key to comments
    sts.settings = {super = "Stuff"} --Set some values
  else
    print(sts.settings) --There were settings stored
  end
end


============================================================================]]--
class 'SongToolSettings'

function SongToolSettings:__init(tool_id, folder_path)
  print("-- SongToolSettings init")
  self.tool_id = assert(tool_id, "Tool id not supplied") 
  self.folder_path = assert(folder_path, "Folder path not supplied")
  self.settings = nil
  self.settings_key = nil

  if self.folder_path:sub(string.len(self.folder_path)) ~= "/" and self.folder_path:sub(string.len(self.folder_path)) ~= "\\" then 
    self.folder_path = self.folder_path .. "/" 
  end
  
  assert(io.exists(self.folder_path),"Folder path (" .. self.folder_path .. ") did not exist")

  --== Super-check to prevent error if song is not yet ready (if object is created too early) ==--
  local song_exists,val = pcall(renoise.song)
  if song_exists then
    self.settings_key = self:get_key()
    self:load()
  end
end

--== Create a new key and add to song comments ==--
function SongToolSettings:create_key()
  local key = kinda_unique_key()
  local comments = renoise.song().comments
  local found = false
  for i=1,#comments do
    if comments[i]:find(self.tool_id .. ":") == 1 then
      comments[i] = self.tool_id .. ":" .. key
      found = true
      print("Key found, replacing")
      break
    end
  end
  if not found then
    print("Key not found, adding")
    print(self)
    comments[#comments] = self.tool_id .. ":" .. key
  end
  renoise.song().comments = comments
  self.settings_key = key
end

--== Song has key? ==--
function SongToolSettings:has_key()
  return self:get_key() ~= nil
end

--== Get key from song comments (used internally) ==--
function SongToolSettings:get_key()
  local key = nil
  for i=1,#renoise.song().comments do
    if renoise.song().comments[i]:find(self.tool_id .. ":") == 1 then
      key = renoise.song().comments[i]:sub(string.len(self.tool_id)+2)
      break
    end
  end
  return key
end

--== Load settings from file if key exists (used internally when a new song is present) ==--
function SongToolSettings:load()
  local tbl = nil
  if self.settings_key ~= nil then
    local file_path = self.folder_path .. self.settings_key .. ".lua"
    tbl = self:load_file(file_path)
    print("Loading: " .. file_path)
    if tbl ~= nil then
      if tbl.file_name ~= renoise.song().file_name then
        print("Filename differs, look for old_settings")
        local file_name = renoise.song().file_name
        if tbl.old_settings[file_name] ~= nil then
          print("Old_settings for filename existed, using")
          self.settings = tbl.old_settings[file_name]
        end
        self:create_key()
      end
      if self.settings == nil and tbl.settings ~= nil then
        self.settings = tbl.settings
      end
    end
  end
  return self.settings
end

--== Do the actual loading of the file (used internally) ==--
function SongToolSettings:load_file(file_path)
  local tbl = nil
  if io.exists(file_path) then
    tbl = persistence.load(file_path)
  end
  return tbl
end

--== Save settings as file, if settings has value and there is a key created ==--
function SongToolSettings:save(settings)
  if settings ~=  nil then
    self.settings = settings
  end
  if self.settings ~=  nil then
    if self.settings_key ~= nil then
      local file_path = self.folder_path .. self.settings_key .. ".lua"
      local tbl_settings = self:load_file(file_path)
      if tbl_settings ~= nil then
        print("There was an existing settings file")
        if tbl_settings.file_name ~= renoise.song().file_name then
          print("Existing settings filename differed, store away")
          tbl_settings.old_settings[tbl_settings.file_name] = tbl_settings.settings
        end
        tbl_settings.file_name = renoise.song().file_name
        tbl_settings.settings = self.settings
      else
        tbl_settings = {
          file_name = renoise.song().file_name,
          settings = self.settings,
          old_settings = {}
        }      
      end
      persistence.store(file_path, tbl_settings)
      print("Saved: " .. file_path)
    else
      print("No key, settings not created, cannot save")
    end
  end
end
