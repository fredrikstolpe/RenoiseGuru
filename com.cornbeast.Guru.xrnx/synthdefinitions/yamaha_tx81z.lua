local group_operator1 = Group {
  name = "OP1",
  Parameter {
    sysex_message_template = {0xF0, 0x43, 0x10, 0x13, "nn", "vv", 0xF7},
    id = "Waveform1",
    name = "Waveform",
    number = 18,
    items = {"W1","W2","W3","W4","W5","W6","W7","W8"},
    item_values = {0,1,2,3,4,5,6,7},
  },
  Parameter {
    id = "Level1",
    name = "Level",
    number = 49,
    max_value = 99,
  },
  Parameter {
    id = "Ratio1",
    name = "Ratio",
    number = 50,
    max_value = 63,
  },
  Parameter {
    id = "Detune1",
    name = "Detune",
    number = 51,
    max_value = 6,
    default_value = 3
  },
  Parameter {
    sysex_message_template = {0xF0, 0x43, 0x10, 0x13, "nn", "vv", 0xF7},
    id ="Frequency1",
    name = "Frequency",
    number = 15,
    items = {"ratio","fixed"},
  },
  Parameter {
    sysex_message_template = {0xF0, 0x43, 0x10, 0x13, "nn", "vv", 0xF7},
    id = "Fixed_freqrange1",
    name = "Fixed_freqrange",
    number = 16,
    max_value = 7,
  },
  Parameter {
    sysex_message_template = {0xF0, 0x43, 0x10, 0x13, "nn", "vv", 0xF7},
    id = "Fixed_freqfine1",
    name = "Fixed_freqfine",
    number = 16,
    max_value = 15,
  }
}

local group_op1envelope = Group {
  name = "OP1env",
  Parameter {
    id = "Attack_rate1",
    name = "Attack_rate",
    number = 39,
    max_value = 31,
  },
  Parameter {
    id = "Decay_rate1",
    name = "Decay_rate",
    number = 40,
    max_value = 31,
  },
  Parameter {
    id = "Decay_level1",
    name = "Decay_level",
    number = 43,
    max_value = 15,
  },
  Parameter {
    id = "Decay_rate12",
    name = "Decay_rate_2",
    number = 41,
    max_value = 31,
  },
  Parameter {
    id = "Release_rate1",
    name = "Release_rate",
    number = 42,
    max_value = 15,
  }
}

local group_key1 = Group {
 name = "KEY1",
 Parameter {
    id = "Keyscale_rate1",
    name = "Keyscale_rate",
    number = 45,
    max_value = 3,
  },
  Parameter {
    id = "Keyscale_level1",
    name = "Keyscale_level",
    number = 44,
    max_value = 99,
  },
  Parameter {
    id = "EGbias1",
    name = "EGbias",
    number = 46,
    max_value = 7,
  },
  Parameter {
    id = "Key_velocity1",
    name = "Key_velocity",
    number = 48,
    max_value = 7,
  },
  Parameter {
    id = "Amp_mod1",
    name = "Amp_mod",
    number = 47,
    items = {"off","on"}
  }
}

local group_operator3 = Group {
  name = "OP3",
  Parameter {
    sysex_message_template = {0xF0, 0x43, 0x10, 0x13, "nn", "vv", 0xF7},
    id = "Waveform3",
    name = "Waveform",
    number = 13,
    items = {"W1","W2","W3","W4","W5","W6","W7","W8"},
    item_values = {0,1,2,3,4,5,6,7},
  },
  Parameter {
    id = "Level3",
    name = "Level",
    number = 36,
    max_value = 99,
  },
  Parameter {
    id = "Ratio3",
    name = "Ratio",
    number = 37,
    max_value = 63,
  },
  Parameter {
    id = "Detune3",
    name = "Detune",
    number = 38,
    max_value = 6,
    default_value = 3,
  },
  Parameter {
    sysex_message_template = {0xF0, 0x43, 0x10, 0x13, "nn", "vv", 0xF7},
    id ="Frequency3",
    name = "Frequency",
    number = 10,
    --max_value = 31,
    items = {"ratio","fixed"},
  },
  Parameter {
    sysex_message_template = {0xF0, 0x43, 0x10, 0x13, "nn", "vv", 0xF7},
    id = "Fixed_freqrange3",
    name = "Fixed_freqrange",
    number = 11,
    max_value = 7,
  },
  Parameter {
    sysex_message_template = {0xF0, 0x43, 0x10, 0x13, "nn", "vv", 0xF7},
    id = "Fixed_freqfine3",
    name = "Fixed_freqfine",
    number = 12,
    max_value = 15,
  }
}

local group_op3envelope = Group {
  name = "OP3env",
  Parameter {
    id = "Attack_rate3",
    name = "Attack_rate",
    number = 26,
    max_value = 31,
  },
  Parameter {
    id = "Decay_rate31",
    name = "Decay_rate_1",
    number = 27,
    max_value = 31,
  },
  Parameter {
    id = "Decay_level3",
    name = "Decay_level",
    number = 30,
    max_value = 15,
  },
  Parameter {
    id = "Decay_rate32",
    name = "Decay_rate_2",
    number = 28,
    max_value = 31,
  },
  Parameter {
    id = "Release_rate3",
    name = "Release_rate",
    number = 29,
    max_value = 15,
  }
}

local group_key3 = Group {
 name = "KEY3",
 Parameter {
    id = "Keyscale_rate3",
    name = "Keyscale_rate",
    number = 32,
    max_value = 3,
  },
  Parameter {
    id = "Keyscale_level3",
    name = "Keyscale_level",
    number = 31,
    max_value = 99,
  },
  Parameter {
    id = "EGbias3",
    name = "EGbias",
    number = 33,
    max_value = 7,
  },
  Parameter {
    id = "Key_velocity3",
    name = "Key_velocity",
    number = 35,
    max_value = 7,
  },
  Parameter {
    id = "Amp_mod3",
    name = "Amp_mod",
    number = 34,
    items = {"off","on"}
  }
}
  
local group_operator2 = Group {
  name = "OP2",
  Parameter {
    sysex_message_template = {0xF0, 0x43, 0x10, 0x13, "nn", "vv", 0xF7},
    id = "Waveform2",
    name = "Waveform",
    number = 8,
    items = {"W1","W2","W3","W4","W5","W6","W7","W8"},
    item_values = {0,1,2,3,4,5,6,7},
  },
  Parameter {
    id = "Level2",
    name = "Level",
    number = 23,
    max_value = 99,
  },
  Parameter {
    id = "Ratio2",
    name = "Ratio",
    number = 24,
    max_value = 63,
  },
  Parameter {
    id = "Detune2",
    name = "Detune",
    number = 25,
    max_value = 6,
    default_value = 3,
  },
  Parameter {
    sysex_message_template = {0xF0, 0x43, 0x10, 0x13, "nn", "vv", 0xF7},
    id ="Frequency2",
    name = "Frequency",
    number = 5,
    items = {"ratio","fixed"},
  },
  Parameter {
    sysex_message_template = {0xF0, 0x43, 0x10, 0x13, "nn", "vv", 0xF7},
    id = "Fixed_freqrange2",
    name = "Fixed_freqrange",
    number = 6,
    max_value = 7,
  },
  Parameter {
    sysex_message_template = {0xF0, 0x43, 0x10, 0x13, "nn", "vv", 0xF7},
    id = "Fixed_freqfine2",
    name = "Fixed_freqfine",
    number = 7,
    max_value = 15,
  }
}


local group_op2envelope = Group {
  name = "OP2env",
  Parameter {
    id = "Attack_rate2",
    name = "Attack_rate",
    number = 13,
    max_value = 31,
  },
  Parameter {
    id = "Decay_rate21",
    name = "Decay_rate_1",
    number = 14,
    max_value = 31,
  },
  Parameter {
    id = "Decay_level2",
    name = "Decay_level",
    number = 17,
    max_value = 15,
  },
  Parameter {
    id = "Decay_rate22",
    name = "Decay_rate_2",
    number = 15,
    max_value = 31,
  },
  Parameter {
    id = "Release_rate2",
    name = "Release_rate",
    number = 16,
    max_value = 15,
  }
}

local group_key2 = Group {
 name = "KEY2",
 Parameter {
    id = "Keyscale_rate2",
    name = "Keyscale_rate",
    number = 18,
    max_value = 3,
  },
  Parameter {
    id = "Keyscale_level2",
    name = "Keyscale_level",
    number = 19,
    max_value = 99,
  },
  Parameter {
    id = "EGbias2",
    name = "EGbias",
    number = 20,
    max_value = 7,
  },
  Parameter {
    id = "Key_velocity2",
    name = "Key_velocity",
    number = 22,
    max_value = 7,
  },
  Parameter {
    id = "Amp_mod2",
    name = "Amp_mod",
    number = 21,
    items = {"off","on"}
  }
}

local group_operator4 = Group {
  name = "OP4",
  Parameter {
    sysex_message_template = {0xF0, 0x43, 0x10, 0x13, "nn", "vv", 0xF7},
    id = "Waveform4",
    name = "Waveform",
    number = 3,
    items = {"W1","W2","W3","W4","W5","W6","W7","W8"},
    item_values = {0,1,2,3,4,5,6,7},
  },
  Parameter {
    id = "Level4",
    name = "Level",
    number = 10,
    max_value = 99,
  },
  Parameter {
    id = "Ratio4",
    name = "Ratio",
    number = 11,
    max_value = 63,
  },
  Parameter {
    id = "Detune4",
    name = "Detune",
    number = 12,
    max_value = 6,
    default_value = 3,
  },
  Parameter {
    sysex_message_template = {0xF0, 0x43, 0x10, 0x13, "nn", "vv", 0xF7},
    id ="Frequency4",
    name = "Frequency",
    number = 0,
    items = {"ratio","fixed"},
  },
  Parameter {
    sysex_message_template = {0xF0, 0x43, 0x10, 0x13, "nn", "vv", 0xF7},
    id = "Fixed_freqrange4",
    name = "Fixed_freqrange",
    number = 1,
    max_value = 7,
  },  
  Parameter {
    sysex_message_template = {0xF0, 0x43, 0x10, 0x13, "nn", "vv", 0xF7},
    id = "Fixed_freqfine4",
    name = "Fixed_freqfine",
    number = 2,
    max_value = 15,
  }
}

local group_op4envelope = Group {
  name = "OP4env",
  Parameter {
    id = "Attack_rate4",
    name = "Attack_rate",
    number = 0,
    max_value = 31,
  },
  Parameter {
    id = "Decay_rate14",
    name = "Decay_rate1",
    number = 1,
    max_value = 31,
  },
  Parameter {
    id = "Decay_level4",
    name = "Decay_level",
    number = 4,
    max_value = 15,
  },
  Parameter {
    id = "Decay_rate42",
    name = "Decay_rate2",
    number = 2,
    max_value = 31,
  },
  Parameter {
    id = "Release_rate4",
    name = "Release_rate",
    number = 3,
    max_value = 15,
  }
}

local group_key4 = Group {
 name = "KEY4",
 Parameter {
    id = "Keyscale_rate4",
    name = "Keyscale_rate",
    number = 6,
    max_value = 3,
  },
  Parameter {
    id = "Keyscale_level4",
    name = "Keyscale_level",
    number = 5,
    max_value = 99,
  },
  Parameter {
    id = "EGbias4",
    name = "EGbias",
    number = 7,
    max_value = 7,
  },
  Parameter {
    id = "Key_velocity4",
    name = "Key_velocity",
    number = 9,
    max_value = 7,
  },
  Parameter {
    id = "Amp_mod4",
    name = "Amp_mod",
    number = 8,
    items = {"off","on"}
  }
}

local group_algorithm = Group {
 name = "Algorithm",
 Parameter {
    id = "Algorithm",
    name= "Algorithm",
    number = 52,
    items = {"1","2","3","4","5","6","7","8"},
    item_values = {0,1,2,3,4,5,6,7},
 },

 Parameter {
    id = "Feedback",
    name= "Feedback",
    number = 53,
    max_value = 7,
    }, 
    
 Parameter {
    id = "Pitchbend_range",
    name= "Pitchbend_range",
    number = 64,
    max_value = 12,
    }, 
 
  Parameter {
    id = "Mode",
    name= "Mode",
    number = 63,
    items = {"poly","mono"},
    }, 
    
  Parameter {
    sysex_message_template = {0xF0, 0x43, 0x10, 0x13, "nn", "vv", 0xF7}, 
    id = "Reverb_rate",
    name= "Reverb_rate",
    number = 20,
    max_value = 7, 
  }  
}


local group_lfo = Group {
 name = "LFO",
 Parameter {
    id = "Lfo_shape",
    name= "Lfo_shape",
    number = 59,
    items = {"saw","square","triangle","random"},
 },
 Parameter {
    id = "Lfo_speed",
    name= "Lfo_speed",
    number = 54,
    max_value = 99,
 },
 Parameter {
    id = "Lfo_delay",
    name= "Lfo_delay",
    number = 55,
    max_value = 99,
 },
 Parameter {
    id = "Lfo_sync",
    name= "Lfo_sync",
    number = 58,
    items = {"off","on"},
  }
}

local group_portamento = Group {
 name = "Portamento",
 Parameter {
    id = "portamento",
    name= "Portamento",
    number = 65,
 },
 Parameter {
    id = "Portamento_time",
    name= "Portamento_time",
    number = 66,
    max_value = 99,
 }
}

local group_modulation = Group {
 name = "Modulation",
 Parameter {
    id = "Pitch_mod_sens",
    name= "Pitch_mod_sens",
    number = 60,
    max_value = 7,
 },
 Parameter {
    id = "Amp_mod_sens",
    name= "Amp_mod_sens",
    number = 61,
    max_value = 3,
 },
 Parameter {
    id = "Pitch_mod_depht",
    name= "Pitch_mod_depht",
    number = 56,
    max_value = 99,
 },
 Parameter {
    id = "Amp_mod_depht",
    name= "Amp_mod_depht",
    number = 57,
    max_value = 99,
 }
}

local group_modwheel = Group {
 name = "Modwheel",
 Parameter {
    id = "Modwheel_pitch",
    name= "Modwheel_pitch",
    number = 71,
    max_value = 99,
 },
 Parameter {
    id = "Modwheel_amp",
    name= "Modwheel_amp",
    number = 72,
    max_value = 99,
 },
}

local group_breathcontrol = Group {
 name = "Breathcontrol",
 Parameter {
    id = "Bc_pitch",
    name= "Bc_pitch",
    number = 73,
    max_value = 99,
 },
 Parameter {
    id = "Bc_amp",
    name= "Bc_amp",
    number = 74,
    max_value = 99,
 },
 Parameter {
    id = "Bc_pitch_bias",
    name= "Bc_pitch_bias",
    number = 75,
    max_value = 99,
    default_value = 50,
 },
 Parameter {
    id = "Bc_eg_bias",
    name= "Bc_eg_bias",
    number = 76,
    max_value = 99,
    default_value = 50,
 }
}

local group_EG_shift = Group {
 name = "EG_shift",
 Parameter {
    sysex_message_template = {0xF0, 0x43, 0x10, 0x13, "nn", "vv", 0xF7}, 
    id = "EG_shift1",
    name= "EG_shift1",
    number = 19,
    max_value = 3, 
 },
 Parameter {
    sysex_message_template = {0xF0, 0x43, 0x10, 0x13, "nn", "vv", 0xF7}, 
    id = "EG_shift2",
    name= "EG_shift2",
    number = 9,
    max_value = 3, 
 },
 Parameter {
    sysex_message_template = {0xF0, 0x43, 0x10, 0x13, "nn", "vv", 0xF7}, 
    id = "EG_shift3",
    name= "EG_shift3",
    number = 14,
    max_value = 3, 
 },
 Parameter {
    sysex_message_template = {0xF0, 0x43, 0x10, 0x13, "nn", "vv", 0xF7}, 
    id = "EG_shift4",
    name= "EG_shift4",
    number = 4,
    max_value = 3, 
 }
} 

return SynthDefinition {
  id = "yamaha_tx81z", 
  name = "Yamaha TX81Z",
  author = "neopan",
  beta = true,
  delay_between_midi_messages = 10,
  content_height = 530,
  Section {
    sysex_message_template = {0xF0, 0x43, 0x10, 0x12, "nn", "vv", 0xF7},
    name = "OP1/OP2/OP3",
    group_operator1,
    group_op1envelope,
    group_key1,
    group_operator2,
    group_op2envelope,
    group_key2,
    group_operator3,
    group_op3envelope,
    group_key3,
  },
  Section {
    sysex_message_template = {0xF0, 0x43, 0x10, 0x12, "nn", "vv", 0xF7},
    name = "OP4/MASTER",
    group_operator4,
    group_op4envelope,
    group_key4,
    group_algorithm,
    group_lfo,
    group_portamento,
    group_modulation,
    group_modwheel,
    group_breathcontrol,
    group_EG_shift,
  }
}
