--[[============================================================================

Guru V1.6
Generic midi synth mapper for Renoise

============================================================================

Todo: 

* Blofeld change to :value(xxx)
* DW8000 midi channel: "3n  Where n = the MIDI channel of your DW-8000: 30 = channel 1...3f = channel 16"
* Fun stuff: random patches, morph between patches :-)
* Read incoming sysex patch dumps
* Send patch dumps in one message

(less important:)
* Download synth defs and patches from the interrrnett and store locally
* Versions number and handling of patch docs and different synth definitions?
* Midi mapping, only change message when value matches original
* When opening a patch doc with lesser parameters than synth - set values to default
* Better handling of loading patch documents with crazy values
* Verify that parameter id:s (and sysex parameter ids?) are not specified more than one time
* ms ls nibbles (evolver) etc
* Implement "cc_pair"
* For a switch, midi mapping in value has to match items out value, maybe add ability to specify what in values = what out values
* Implement setfenv when loading synthdefs
* DONE: Separate midi device selection per synth instead of one common?
* DONE: Logic to avoid dupe updates when loading a patch document (don't send notifiers when loading a document and updating all)
* DONE: Improve values vs ui. Pitch bend should show (and store?) -100% 0% +100% instead of value

============================================================================]]--

require "utils"
require "persistence"
require "class_songtoolsettings"
require "class_guru"
require "class_midi"
require "class_synthdefinition"
require "class_section"
require "class_group"
require "class_parameter"

--== Initialize ==--
function init()
  local guru = Guru()
  guru:create_menu()
end

init()
