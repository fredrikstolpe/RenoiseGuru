local group_lfo = Group {
  name = "LFO",
  Parameter {
    id = "Waveform",
    name = "Waveform",
    number = 34,
    items = {"Triangle","Saw","Inv Saw","Square"},
    item_values = {0,1,2,3},
  },
  Parameter {
    id = "lfo_delay_time",
    name = "Delay",
    number = 36,
    max_value = 31,
  },
   Parameter {
    id = "lfo_frequency",
    name = "Frequency",
    number = 35,
    max_value = 31,
  },
   Parameter {
    id = "osc_depth",
    name = "Osc Depth",
    number = 37,
    max_value = 31,
  },
 Parameter {
    id = "VCF_depth",
    name = "VCF Depth",
    number = 38,
    max_value = 31,
  }  
}

local group_osc2 = Group {
 name = "OSC2",
  Parameter {
    id = "Octave2",
    name = "Octave 2",
    number = 7,
    items = {"16","8","4"},
    item_values = {00,01,10}
  },
  Parameter {
    id = "waveform2",
    name = "Waveform 2",
    number = 8,
    items = {"1 Triangle","2 Square","3 Acoustic Piano","4 Electric Piano","5 Electric Piano Hard","6 Clavinet","7 Organ","8 Brass","9 Saxophone","10 Violin","11 Acoustic Guitar","12 Distorted Guitar","13 Electric Bass","14 Digital Bass","15 Bell","16 Sine"},
    item_values = {00,01,02,03,04,05,06,07,08,09,10,11,12,13,14,15,16},
  },
  Parameter {
    id = "level2",
    name = "Level 2",
    number = 9,
    max_value = 31,
  },
  Parameter {
    id = "interval",
    name = "Interval",
    number = 10,
    items = {"1","-3","3","4","5"},
    item_values = {000,001,002,003,004},
  },
  Parameter {
    id = "detune",
    name = "Detune",
    number = 11,
    max_value = 6,
  },
}

local group_other = Group {
  name = "OTHER",
  Parameter {
    id = "portamento",
    name = "Portamento",
    number = 47,
    max_value = 31,
  },
  Parameter {
    id = "noise_level",
    name = "Noise Level",
    number = 12,
    max_value = 31,
  },
  Parameter {
    id = "assign",
    name = "Assign",
    number = 13,
    items = {"Poly1","Poly2","Unison1","Unison2"},
    item_values = {00,01,10,11},
  },
}
local group_aftertouch = Group {
  name = "AFTERTOUCH",
  Parameter {
    id = "Osc_MG",
    name = "Osc MG",
    number = 48,
    max_value = 3,
  },
  Parameter {
    id = "VCF",
    name = "VCF",
    number = 49,
    max_value = 3,
  },
  Parameter {
    id = "VCA",
    name = "VCA",
    number = 50,
    max_value = 3,
  },
 
}

local group_osc1 = Group {
  name = "OSC1",
  Parameter {
    id = "Octave1",
    name = "Octave 1",
    number = 0,
    items = {"16","8","4"},
    item_values = {00,01,10}
  },
  Parameter {
    id = "waveform1", 
    name = "Waveform 1",
    number = 1,
    items = {"1 Triangle","2 Square","3 Acoustic Piano","4 Electric Piano","5 Electric Piano Hard","6 Clavinet","7 Organ","8 Brass","9 Saxophone","10 Violin","11 Acoustic Guitar","12 Distorted Guitar","13 Electric Bass","14 Digital Bass","15 Bell","16 Sine"},
    item_values = {00,01,02,03,04,05,06,07,08,09,10,11,12,13,14,15,16},
  },
  Parameter {
    id = "level1",
    name = "Level 1",
    number = 2,
    max_value = 31,
  },
  Parameter {
    id = "bend_select",
    name = "Bend Select",
    number = 3,
    items = {"Off","Osc1","Osc2","Both"},
    item_values = {00,01,10,11},
  },
  Parameter {
    id = "Bend_mode",
    name = "Bend Mode",
    number = 4,
    items = {"Up","Down"},
    item_values = {0,1},
  },
  Parameter {
    id = "Bend_time",
    name = "Bend Time",
    number = 5,
    max_value = 31,
  },
  Parameter {
    id = "Bend_intensity",
    name = "Bend Intensity",
    number = 6,
     max_value = 31,
  },
}
local group_vcf = Group {
  name = "VCF",
  Parameter {
    id = "vcf_cutoff_freq",
    name = "Cutoff",
    number = 15,
    max_value = 63,
  },
  Parameter {
    id = "vcf_resonance",
    name = "Resonance",
    number = 16,
    max_value = 31,
  },
  Parameter {
    id = "vcf_keyboard_track",
    name = "KBD Track",
    number = 17,
    items = {"0","1/4","1/2","1"},
    item_values = {00,01,10,11},
  },
  Parameter {
    id = "polarity",
    name = "Polarity",
    number = 18,
    items = {"1","2"},
    item_values = {0,1},
  },
  Parameter {
    id = "EG_intensity",
    name = "EG Intensity",
    number = 19,
    max_value = 31,
  },
  Parameter {
    id = "vcf_attack_time",
    name = "Attack",
    number = 20,
    max_value = 31,
  },
  Parameter {
    id = "vcf_decay_time",
    name = "Decay",
    number = 21,
    max_value = 31,
  },
  Parameter {
    id = "vcf_break_point",
    name = "Break Point",
    number = 22,
    max_value = 31,
  },
  Parameter {
    id = "vcf_slope",
    name = "Slope",
    number = 23,
    max_value = 31,
  },
  Parameter {
    id = "vcf_Sustain",
    name = "Sustain",
    number = 24,
    max_value = 31,
  },
 Parameter {
    id = "vcf_Release",
    name = "Release",
    number = 25,
    max_value = 31,
  },
  Parameter {
    id = "vcf_velocity_sens",
    name = "Velocity Sens",
    number = 26,
    max_value = 7,
  },
}

local group_delay = Group {
  name = "DELAY",
  Parameter {
    id = "delay_time",
    name = "Delay Time",
    number = 41,
    max_value = 7,
  },
  Parameter {
    id = "delay_factor",
    name = "Factor",
    number = 42,
    max_value = 15,
  },
  Parameter {
    id = "feedback",
    name = "Feedback",
    number = 43,
    max_value = 15,
  },
  Parameter {
    id = "Mod_frequency",
    name = "Mod Frequency",
    number = 44,
    max_value = 31,
  },
  Parameter {
    id = "Mod_intensity",
    name = "Mod Intensity",
    number = 45,
    max_value = 31,
  },
  Parameter {
    id = "effect_level",
    name = "Effect Level",
    number = 46,
    max_value = 15,
  },
}

local group_vca = Group {
  name = "VCA",
  Parameter {
    id = "env_attack_time",
    name = "Attack",
    number = 27,
    max_value = 31,
  },
  Parameter {
    id = "env_decay_time",
    name = "Decay",
    number = 28,
    max_value = 31,
  },
  Parameter {
    id = "env_break_point",
    name = "Break Point",
    number = 29,
    max_value = 31,
  },
  Parameter {
    id = "env_slope",
    name = "Slope",
    number = 30,
    max_value = 31,
  },
  Parameter {
    id = "env_Sustain",
    name = "Sustain",
    number = 31,
    max_value = 31,
  },
 Parameter {
    id = "env_Release",
    name = "Release",
    number = 32,
    max_value = 31,
  },
  Parameter {
    id = "env_velocity_sens",
    name = "Velocity Sens",
    number = 33,
    max_value = 7,
  },
}

return SynthDefinition {
  id = "korg_dw8000",
  name = "Korg DW8000",
  author = "Daniel",
  beta = true,
  Section {
    sysex_message_template = {0xF0, 0x42, 0x31, 0x03, 0x41, "nn", "vv", 0xF7},
    group_osc1,
    group_osc2,
    group_aftertouch,
    group_lfo,
    group_vcf, 
    group_vca,
    group_delay,
    group_other,
  }
}
