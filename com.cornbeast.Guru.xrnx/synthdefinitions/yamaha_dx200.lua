local group_scene = Group {
  name = "Scene",
  Parameter {
    id = "scene_parameter",
    name = "Scene",
    type = "cc",
    number = 3,
  }
}

local group_lfo = Group {
  name = "LFO",
  Parameter {
    id = "lfo_wave_parameter",
    name = "Wave",
    type = "cc",
    number = 15,
    items = {"Tri", "Saw", "Sqr", "Sine", "S&H"}
  },
  Parameter {
    id = "lfo_pmd_parameter",
    name = "Pitch Mod",
    type = "cc",
    number = 18
  },
  Parameter {
    id = "lfo_fmd_parameter",
    name = "Filter Mod",
    type = "cc",
    number = 19
  },
  Parameter {
    id = "lfo_amd_parameter",
    name = "Amp Mod",
    type = "cc",
    number = 80
  },
  Parameter {
    id = "lfo_speed_parameter",
    name = "Speed",
    type = "cc",
    number = 16,
  }
}

local group_aeg = Group {
  name = "AEG",
  Parameter {
    id = "aeg_attack_parameter",
    name = "Attack",
    type = "cc",
    number = 73,
  },
  Parameter {
    id = "aeg_decay_parameter",
    name = "Decay",
    type = "cc",
    number = 75,
  },
  Parameter {
    id = "aeg_sustain_parameter",
    name = "Sustain",
    type = "cc",
    number = 31,
  },
  Parameter {
    id = "aeg_release_parameter",
    name = "Release",
    type = "cc",
    number = 72,
  },
}

local group_feg = Group {
  name = "FEG",
  Parameter {
    id = "feg_attack_parameter",
    name = "Attack",
    type = "cc",
    number = 82,
  },
  Parameter {
    id = "feg_decay_parameter",
    name = "Decay",
    type = "cc",
    number = 83,
  },
  Parameter {
    id = "feg_sustain_parameter",
    name = "Sustain",
    type = "cc",
    number = 28,
  },
  Parameter {
    id = "feg_release_parameter",
    name = "Release",
    type = "cc",
    number = 29,
  }
}

local group_common = Group {
  name = "Common",
  Parameter {
    id = "common_key_a_parameter",
    name = "Key Assign A",
    type = "cc",
    number = 8,
  },
  Parameter {
    id = "common_key_b_parameter",
    name = "Key Assign B",
    type = "cc",
    number = 9,
  },
  Parameter {
    id = "common_portamento_parameter",
    name = "Portamento",
    type = "cc",
    number = 5,
  },
}

local group_algorithm = Group {
  name = "Algorithm",
  Parameter {
    id = "algorithm_parameter",
    name = "Algorithm",
    type = "cc",
    number = 33,
    default_value = 1,
    items = {
        "1", "2", "3", "4", "5", "6", "7", "8", "9",
        "10", "11", "12", "13", "14", "15", "16", "17", "18", "19",
        "20", "21", "22", "23", "24", "25", "26", "27", "28", "29",
        "30","31", "32"
    }
  }
}

local group_noise_osc = Group {
  name = "Noise",
  Parameter {
    id = "noise_type_parameter",
    name = "Type",
    type = "cc",
    number = 51
  }
}

local group_vcf = Group {
  name = "VCF",
  Parameter {
    id = "vcf_cutoff_parameter",
    name = "Cutoff",
    type = "cc",
    number = 74,
    default_value = 63
  },
  Parameter {
    id = "vcf_type_parameter",
    name = "Type",
    type = "cc",
    number = 59,
    items = {"24dB", "18dB", "12dB", "BPF", "HPF", "BEF"},
    default_value = 1
  },
  Parameter {
    id = "vcf_resonance_parameter",
    name = "Resonance",
    type = "cc",
    number = 71,
    default_value = 0
  },
  Parameter {
    id = "vcf_eg_depth_parameter",
    name = "FEG Depth",
    type = "cc",
    number = 81,
    default_value = 63
  } 
}

local group_distortion = Group {
  name = "Distortion",
  Parameter {
    id = "distortion_parameter",
    name = "Distortion",
    type = "cc",
    number = 49,
    items = {"Off", "On"},
    default_value = 1
  }
}

local group_effect = Group {
  name = "Effect",
  Parameter {
    id = "effect_type_a_parameter",
    name = "Type A",
    type = "cc",
    number = 88,
    items = {"Delay", "Flanger", "Phaser", "OD+Amp"},
    default_value = 1
  },
  Parameter {
    -- This is actually the subtype param for the FX type. Why, Yamaha, Why? 
    id = "effect_type_b_parameter",
    name = "Type B",
    type = "cc",
    number = 89
  },
  Parameter {
    id = "effect_param_parameter",
    name = "Param",
    type = "cc",
    number = 48
  },
  Parameter {
    id = "effect_send_parameter",
    name = "Wet / Send",
    type = "cc",
    number = 94
  }
}

local group_mixer = Group {
  name = "Mixer",
  Parameter {
    id = "mixer_pan_parameter",
    name = "Pan",
    type = "cc",
    number = 10,
    default_value = 63
  },
  Parameter {
    id = "mixer_volume_parameter",
    name = "Volume",
    type = "cc",
    number = 7,
    default_value = 127
  }
}

local group_misc = Group {
  name = "Misc",
  Parameter {
    id = "harmonic_mod1_parameter",
    name = "Harmonic 1",
    type = "cc",
    number = 20
  },
  Parameter {
    id = "harmonic_mod2_parameter",
    name = "Harmonic 2",
    type = "cc",
    number = 21
  },
  Parameter {
    id = "harmonic_mod3_parameter",
    name = "Harmonic 3",
    type = "cc",
    number = 22
  },
  Parameter {
    id = "fm_depth1_parameter",
    name = "FM Depth 1",
    type = "cc",
    number = 23
  },
  Parameter {
    id = "fm_depth2_parameter",
    name = "FM Depth 2",
    type = "cc",
    number = 24
  },
  Parameter {
    id = "fm_depth3_parameter",
    name = "FM Depth 3",
    type = "cc",
    number = 25
  },
  Parameter {
    id = "fm_decay1_parameter",
    name = "FM Decay 1",
    type = "cc",
    number = 26
  },
  Parameter {
    id = "fm_decay2_parameter",
    name = "FM Decay 2",
    type = "cc",
    number = 27
  },
  Parameter {
    id = "fm_decay3_parameter",
    name = "FM Decay 3",
    type = "cc",
    number = 28
  },
  Parameter {
    id = "noise_level_parameter",
    name = "Noise Level",
    type = "cc",
    number = 39
  }
}

local group_dx200_sysex = Group {
  name = "DX200",
  -- sysex_message_template = {0xf0, 0x43, 0x17, 0x62, hh, mm, ll, "vv", 0xf7},
  sysex_message_template = {0xf0, 0x43, 0x17, 0x62, 0x10, 0x00, "nn", "vv", 0xf7},
  Parameter {
    id = "sysex_distortion_parameter",
    name = "Distortion",
    type = "sysex",
    number = 0x00,
    items = {"Off","On"}
  }
}

-- DX7:
-- sysex_message_template = {0xf0, 0x43, 0x11, 0xgg, 0xpp, 0xvv, 0xf7},

local group_dx7_op6 = Group {
  name = "DX7 Op6",
  sysex_message_template = {0xf0, 0x43, 0x11, 0x00, "nn", "vv", 0xf7},
  Parameter {
    id = "dx7_op6_eg_rate1_parameter",
    name = "EG Rate 1",
    type = "sysex",
    number = 0x00,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op6_eg_rate2_parameter",
    name = "EG Rate 2",
    type = "sysex",
    number = 0x01,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op6_eg_rate3_parameter",
    name = "EG Rate 3",
    type = "sysex",
    number = 0x02,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op6_eg_rate4_parameter",
    name = "EG Rate 4",
    type = "sysex",
    number = 0x03,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op6_eg_level1_parameter",
    name = "EG Level 1",
    type = "sysex",
    number = 0x04,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op6_eg_level2_parameter",
    name = "EG Level 2",
    type = "sysex",
    number = 0x05,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op6_eg_level3_parameter",
    name = "EG Level 3",
    type = "sysex",
    number = 0x06,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op6_eg_level4_parameter",
    name = "EG Level 4",
    type = "sysex",
    number = 0x07,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op6_break_point_parameter",
    name = "Break Point",
    type = "sysex",
    number = 0x08,
    max_value = 99,
    default_value = 27
  },
  Parameter {
    id = "dx7_op6_left_depth_parameter",
    name = "Left Depth",
    type = "sysex",
    number = 0x09,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op6_right_depth_parameter",
    name = "Right Depth",
    type = "sysex",
    number = 0x0A,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op6_left_curve_parameter",
    name = "Left Curve",
    type = "sysex",
    number = 0x0B,
    items = {"-lin", "-exp", "+exp", "+lin"},
    default_value = 1
  },
  Parameter {
    id = "dx7_op6_right_curve_parameter",
    name = "Right Curve",
    type = "sysex",
    number = 0x0C,
    items = {"-lin", "-exp", "+exp", "+lin"},
    default_value = 1
  },
  Parameter {
    id = "dx7_op6_rate_scaling_parameter",
    name = "Rate Scaling",
    type = "sysex",
    number = 0x0D,
    max_value = 7,
    default_value = 0
  },
  Parameter {
    id = "dx7_op6_am_sens_parameter",
    name = "AM Sensitivity",
    type = "sysex",
    number = 0x0E,
    max_value = 3,
    default_value = 0
  },
  Parameter {
    id = "dx7_op6_touch_sens_parameter",
    name = "Touch Sensitivity",
    type = "sysex",
    number = 0x0F,
    max_value = 7,
    default_value = 0
  },
  Parameter {
    id = "dx7_op6_total_level_parameter",
    name = "Total Level",
    type = "sysex",
    number = 0x10,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op6_frequency_mode_parameter",
    name = "Frequency Mode",
    type = "sysex",
    number = 0x11,
    items = {"ratio", "fixed"},
    default_value = 1
  },
  Parameter {
    id = "dx7_op6_frequency_coarse_parameter",
    name = "Frequency Coarse",
    type = "sysex",
    number = 0x12,
    max_value = 31,
    default_value = 1
  },
  Parameter {
    id = "dx7_op6_frequency_fine_parameter",
    name = "Frequency Fine",
    type = "sysex",
    number = 0x13,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op6_detune_parameter",
    name = "Detune",
    type = "sysex",
    number = 0x14,
    items = {"-7","-6","-5","-4","-3","-2","-1","0","1","2","3","4","5","6","7"},
    default_value = 8
  }
}

local group_dx7_op5 = Group {
  name = "DX7 Op5",
  sysex_message_template = {0xf0, 0x43, 0x11, 0x00, "nn", "vv", 0xf7},
  Parameter {
    id = "dx7_op5_eg_rate1_parameter",
    name = "EG Rate 1",
    type = "sysex",
    number = 0x15,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op5_eg_rate2_parameter",
    name = "EG Rate 2",
    type = "sysex",
    number = 0x16,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op5_eg_rate3_parameter",
    name = "EG Rate 3",
    type = "sysex",
    number = 0x17,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op5_eg_rate4_parameter",
    name = "EG Rate 4",
    type = "sysex",
    number = 0x18,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op5_eg_level1_parameter",
    name = "EG Level 1",
    type = "sysex",
    number = 0x19,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op5_eg_level2_parameter",
    name = "EG Level 2",
    type = "sysex",
    number = 0x1a,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op5_eg_level3_parameter",
    name = "EG Level 3",
    type = "sysex",
    number = 0x1b,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op5_eg_level4_parameter",
    name = "EG Level 4",
    type = "sysex",
    number = 0x1c,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op5_break_point_parameter",
    name = "Break Point",
    type = "sysex",
    number = 0x1d,
    max_value = 99,
    default_value = 27
  },
  Parameter {
    id = "dx7_op5_left_depth_parameter",
    name = "Left Depth",
    type = "sysex",
    number = 0x1e,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op5_right_depth_parameter",
    name = "Right Depth",
    type = "sysex",
    number = 0x1f,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op5_left_curve_parameter",
    name = "Left Curve",
    type = "sysex",
    number = 0x20,
    items = {"-lin", "-exp", "+exp", "+lin"},
    default_value = 1
  },
  Parameter {
    id = "dx7_op5_right_curve_parameter",
    name = "Right Curve",
    type = "sysex",
    number = 0x21,
    items = {"-lin", "-exp", "+exp", "+lin"},
    default_value = 1
  },
  Parameter {
    id = "dx7_op5_rate_scaling_parameter",
    name = "Rate Scaling",
    type = "sysex",
    number = 0x22,
    max_value = 7,
    default_value = 0
  },
  Parameter {
    id = "dx7_op5_am_sens_parameter",
    name = "AM Sensitivity",
    type = "sysex",
    number = 0x23,
    max_value = 3,
    default_value = 0
  },
  Parameter {
    id = "dx7_op5_touch_sens_parameter",
    name = "Touch Sensitivity",
    type = "sysex",
    number = 0x24,
    max_value = 7,
    default_value = 0
  },
  Parameter {
    id = "dx7_op5_total_level_parameter",
    name = "Total Level",
    type = "sysex",
    number = 0x25,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op5_frequency_mode_parameter",
    name = "Frequency Mode",
    type = "sysex",
    number = 0x26,
    items = {"ratio", "fixed"},
    default_value = 1
  },
  Parameter {
    id = "dx7_op5_frequency_coarse_parameter",
    name = "Frequency Coarse",
    type = "sysex",
    number = 0x27,
    max_value = 31,
    default_value = 1
  },
  Parameter {
    id = "dx7_op5_frequency_fine_parameter",
    name = "Frequency Fine",
    type = "sysex",
    number = 0x28,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op5_detune_parameter",
    name = "Detune",
    type = "sysex",
    number = 0x29,
    items = {"-7","-6","-5","-4","-3","-2","-1","0","1","2","3","4","5","6","7"},
    default_value = 8
  }
}

local group_dx7_op4 = Group {
  name = "DX7 Op4",
  sysex_message_template = {0xf0, 0x43, 0x11, 0x00, "nn", "vv", 0xf7},
  Parameter {
    id = "dx7_op4_eg_rate1_parameter",
    name = "EG Rate 1",
    type = "sysex",
    number = 0x2a,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op4_eg_rate2_parameter",
    name = "EG Rate 2",
    type = "sysex",
    number = 0x2b,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op4_eg_rate3_parameter",
    name = "EG Rate 3",
    type = "sysex",
    number = 0x2c,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op4_eg_rate4_parameter",
    name = "EG Rate 4",
    type = "sysex",
    number = 0x2d,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op4_eg_level1_parameter",
    name = "EG Level 1",
    type = "sysex",
    number = 0x2e,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op4_eg_level2_parameter",
    name = "EG Level 2",
    type = "sysex",
    number = 0x2f,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op4_eg_level3_parameter",
    name = "EG Level 3",
    type = "sysex",
    number = 0x30,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op4_eg_level4_parameter",
    name = "EG Level 4",
    type = "sysex",
    number = 0x31,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op4_break_point_parameter",
    name = "Break Point",
    type = "sysex",
    number = 0x32,
    max_value = 99,
    default_value = 27
  },
  Parameter {
    id = "dx7_op4_left_depth_parameter",
    name = "Left Depth",
    type = "sysex",
    number = 0x33,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op4_right_depth_parameter",
    name = "Right Depth",
    type = "sysex",
    number = 0x34,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op4_left_curve_parameter",
    name = "Left Curve",
    type = "sysex",
    number = 0x35,
    items = {"-lin", "-exp", "+exp", "+lin"},
    default_value = 1
  },
  Parameter {
    id = "dx7_op4_right_curve_parameter",
    name = "Right Curve",
    type = "sysex",
    number = 0x36,
    items = {"-lin", "-exp", "+exp", "+lin"},
    default_value = 1
  },
  Parameter {
    id = "dx7_op4_rate_scaling_parameter",
    name = "Rate Scaling",
    type = "sysex",
    number = 0x37,
    max_value = 7,
    default_value = 0
  },
  Parameter {
    id = "dx7_op4_am_sens_parameter",
    name = "AM Sensitivity",
    type = "sysex",
    number = 0x38,
    max_value = 3,
    default_value = 0
  },
  Parameter {
    id = "dx7_op4_touch_sens_parameter",
    name = "Touch Sensitivity",
    type = "sysex",
    number = 0x39,
    max_value = 7,
    default_value = 0
  },
  Parameter {
    id = "dx7_op4_total_level_parameter",
    name = "Total Level",
    type = "sysex",
    number = 0x3a,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op4_frequency_mode_parameter",
    name = "Frequency Mode",
    type = "sysex",
    number = 0x3b,
    items = {"ratio", "fixed"},
    default_value = 1
  },
  Parameter {
    id = "dx7_op4_frequency_coarse_parameter",
    name = "Frequency Coarse",
    type = "sysex",
    number = 0x3c,
    max_value = 31,
    default_value = 1
  },
  Parameter {
    id = "dx7_op4_frequency_fine_parameter",
    name = "Frequency Fine",
    type = "sysex",
    number = 0x3d,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op4_detune_parameter",
    name = "Detune",
    type = "sysex",
    number = 0x3e,
    items = {"-7","-6","-5","-4","-3","-2","-1","0","1","2","3","4","5","6","7"},
    default_value = 8
  }
}

local group_dx7_op3 = Group {
  name = "DX7 Op3",
  sysex_message_template = {0xf0, 0x43, 0x11, 0x00, "nn", "vv", 0xf7},
  Parameter {
    id = "dx7_op3_eg_rate1_parameter",
    name = "EG Rate 1",
    type = "sysex",
    number = 0x3f,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op3_eg_rate2_parameter",
    name = "EG Rate 2",
    type = "sysex",
    number = 0x40,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op3_eg_rate3_parameter",
    name = "EG Rate 3",
    type = "sysex",
    number = 0x41,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op3_eg_rate4_parameter",
    name = "EG Rate 4",
    type = "sysex",
    number = 0x42,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op3_eg_level1_parameter",
    name = "EG Level 1",
    type = "sysex",
    number = 0x43,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op3_eg_level2_parameter",
    name = "EG Level 2",
    type = "sysex",
    number = 0x44,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op3_eg_level3_parameter",
    name = "EG Level 3",
    type = "sysex",
    number = 0x45,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op3_eg_level4_parameter",
    name = "EG Level 4",
    type = "sysex",
    number = 0x46,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op3_break_point_parameter",
    name = "Break Point",
    type = "sysex",
    number = 0x47,
    max_value = 99,
    default_value = 27
  },
  Parameter {
    id = "dx7_op3_left_depth_parameter",
    name = "Left Depth",
    type = "sysex",
    number = 0x48,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op3_right_depth_parameter",
    name = "Right Depth",
    type = "sysex",
    number = 0x49,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op3_left_curve_parameter",
    name = "Left Curve",
    type = "sysex",
    number = 0x4a,
    items = {"-lin", "-exp", "+exp", "+lin"},
    default_value = 1
  },
  Parameter {
    id = "dx7_op3_right_curve_parameter",
    name = "Right Curve",
    type = "sysex",
    number = 0x4b,
    items = {"-lin", "-exp", "+exp", "+lin"},
    default_value = 1
  },
  Parameter {
    id = "dx7_op3_rate_scaling_parameter",
    name = "Rate Scaling",
    type = "sysex",
    number = 0x4c,
    max_value = 7,
    default_value = 0
  },
  Parameter {
    id = "dx7_op3_am_sens_parameter",
    name = "AM Sensitivity",
    type = "sysex",
    number = 0x4d,
    max_value = 3,
    default_value = 0
  },
  Parameter {
    id = "dx7_op3_touch_sens_parameter",
    name = "Touch Sensitivity",
    type = "sysex",
    number = 0x4e,
    max_value = 7,
    default_value = 0
  },
  Parameter {
    id = "dx7_op3_total_level_parameter",
    name = "Total Level",
    type = "sysex",
    number = 0x4f,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op3_frequency_mode_parameter",
    name = "Frequency Mode",
    type = "sysex",
    number = 0x50,
    items = {"ratio", "fixed"},
    default_value = 1
  },
  Parameter {
    id = "dx7_op3_frequency_coarse_parameter",
    name = "Frequency Coarse",
    type = "sysex",
    number = 0x51,
    max_value = 31,
    default_value = 1
  },
  Parameter {
    id = "dx7_op3_frequency_fine_parameter",
    name = "Frequency Fine",
    type = "sysex",
    number = 0x52,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op3_detune_parameter",
    name = "Detune",
    type = "sysex",
    number = 0x53,
    items = {"-7","-6","-5","-4","-3","-2","-1","0","1","2","3","4","5","6","7"},
    default_value = 8
  }
}

local group_dx7_op2 = Group {
  name = "DX7 Op2",
  sysex_message_template = {0xf0, 0x43, 0x11, 0x00, "nn", "vv", 0xf7},
  Parameter {
    id = "dx7_op2_eg_rate1_parameter",
    name = "EG Rate 1",
    type = "sysex",
    number = 0x54,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op2_eg_rate2_parameter",
    name = "EG Rate 2",
    type = "sysex",
    number = 0x55,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op2_eg_rate3_parameter",
    name = "EG Rate 3",
    type = "sysex",
    number = 0x56,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op2_eg_rate4_parameter",
    name = "EG Rate 4",
    type = "sysex",
    number = 0x57,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op2_eg_level1_parameter",
    name = "EG Level 1",
    type = "sysex",
    number = 0x58,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op2_eg_level2_parameter",
    name = "EG Level 2",
    type = "sysex",
    number = 0x59,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op2_eg_level3_parameter",
    name = "EG Level 3",
    type = "sysex",
    number = 0x5a,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op2_eg_level4_parameter",
    name = "EG Level 4",
    type = "sysex",
    number = 0x5b,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op2_break_point_parameter",
    name = "Break Point",
    type = "sysex",
    number = 0x5c,
    max_value = 99,
    default_value = 27
  },
  Parameter {
    id = "dx7_op2_left_depth_parameter",
    name = "Left Depth",
    type = "sysex",
    number = 0x5d,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op2_right_depth_parameter",
    name = "Right Depth",
    type = "sysex",
    number = 0x5e,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op2_left_curve_parameter",
    name = "Left Curve",
    type = "sysex",
    number = 0x5f,
    items = {"-lin", "-exp", "+exp", "+lin"},
    default_value = 1
  },
  Parameter {
    id = "dx7_op2_right_curve_parameter",
    name = "Right Curve",
    type = "sysex",
    number = 0x60,
    items = {"-lin", "-exp", "+exp", "+lin"},
    default_value = 1
  },
  Parameter {
    id = "dx7_op2_rate_scaling_parameter",
    name = "Rate Scaling",
    type = "sysex",
    number = 0x61,
    max_value = 7,
    default_value = 0
  },
  Parameter {
    id = "dx7_op2_am_sens_parameter",
    name = "AM Sensitivity",
    type = "sysex",
    number = 0x62,
    max_value = 3,
    default_value = 0
  },
  Parameter {
    id = "dx7_op2_touch_sens_parameter",
    name = "Touch Sensitivity",
    type = "sysex",
    number = 0x63,
    max_value = 7,
    default_value = 0
  },
  Parameter {
    id = "dx7_op2_total_level_parameter",
    name = "Total Level",
    type = "sysex",
    number = 0x64,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op2_frequency_mode_parameter",
    name = "Frequency Mode",
    type = "sysex",
    number = 0x65,
    items = {"ratio", "fixed"},
    default_value = 1
  },
  Parameter {
    id = "dx7_op2_frequency_coarse_parameter",
    name = "Frequency Coarse",
    type = "sysex",
    number = 0x66,
    max_value = 31,
    default_value = 1
  },
  Parameter {
    id = "dx7_op2_frequency_fine_parameter",
    name = "Frequency Fine",
    type = "sysex",
    number = 0x67,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op2_detune_parameter",
    name = "Detune",
    type = "sysex",
    number = 0x68,
    items = {"-7","-6","-5","-4","-3","-2","-1","0","1","2","3","4","5","6","7"},
    default_value = 8
  }
}

local group_dx7_op1 = Group {
  name = "DX7 Op1",
  sysex_message_template = {0xf0, 0x43, 0x11, 0x00, "nn", "vv", 0xf7},
  Parameter {
    id = "dx7_op1_eg_rate1_parameter",
    name = "EG Rate 1",
    type = "sysex",
    number = 0x69,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op1_eg_rate2_parameter",
    name = "EG Rate 2",
    type = "sysex",
    number = 0x6a,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op1_eg_rate3_parameter",
    name = "EG Rate 3",
    type = "sysex",
    number = 0x6b,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op1_eg_rate4_parameter",
    name = "EG Rate 4",
    type = "sysex",
    number = 0x6c,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op1_eg_level1_parameter",
    name = "EG Level 1",
    type = "sysex",
    number = 0x6d,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op1_eg_level2_parameter",
    name = "EG Level 2",
    type = "sysex",
    number = 0x6e,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op1_eg_level3_parameter",
    name = "EG Level 3",
    type = "sysex",
    number = 0x6f,
    max_value = 99,
    default_value = 63
  },
  Parameter {
    id = "dx7_op1_eg_level4_parameter",
    name = "EG Level 4",
    type = "sysex",
    number = 0x70,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op1_break_point_parameter",
    name = "Break Point",
    type = "sysex",
    number = 0x71,
    max_value = 99,
    default_value = 27
  },
  Parameter {
    id = "dx7_op1_left_depth_parameter",
    name = "Left Depth",
    type = "sysex",
    number = 0x72,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op1_right_depth_parameter",
    name = "Right Depth",
    type = "sysex",
    number = 0x73,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op1_left_curve_parameter",
    name = "Left Curve",
    type = "sysex",
    number = 0x74,
    items = {"-lin", "-exp", "+exp", "+lin"},
    default_value = 1
  },
  Parameter {
    id = "dx7_op1_right_curve_parameter",
    name = "Right Curve",
    type = "sysex",
    number = 0x75,
    items = {"-lin", "-exp", "+exp", "+lin"},
    default_value = 1
  },
  Parameter {
    id = "dx7_op1_rate_scaling_parameter",
    name = "Rate Scaling",
    type = "sysex",
    number = 0x76,
    max_value = 7,
    default_value = 0
  },
  Parameter {
    id = "dx7_op1_am_sens_parameter",
    name = "AM Sensitivity",
    type = "sysex",
    number = 0x77,
    max_value = 3,
    default_value = 0
  },
  Parameter {
    id = "dx7_op1_touch_sens_parameter",
    name = "Touch Sensitivity",
    type = "sysex",
    number = 0x78,
    max_value = 7,
    default_value = 0
  },
  Parameter {
    id = "dx7_op1_total_level_parameter",
    name = "Total Level",
    type = "sysex",
    number = 0x79,
    max_value = 99,
    default_value = 99
  },
  Parameter {
    id = "dx7_op1_frequency_mode_parameter",
    name = "Frequency Mode",
    type = "sysex",
    number = 0x7a,
    items = {"ratio", "fixed"},
    default_value = 1
  },
  Parameter {
    id = "dx7_op1_frequency_coarse_parameter",
    name = "Frequency Coarse",
    type = "sysex",
    number = 0x7b,
    max_value = 31,
    default_value = 1
  },
  Parameter {
    id = "dx7_op1_frequency_fine_parameter",
    name = "Frequency Fine",
    type = "sysex",
    number = 0x7c,
    max_value = 99,
    default_value = 0
  },
  Parameter {
    id = "dx7_op1_detune_parameter",
    name = "Detune",
    type = "sysex",
    number = 0x7d,
    items = {"-7","-6","-5","-4","-3","-2","-1","0","1","2","3","4","5","6","7"},
    default_value = 8
  }
}

return SynthDefinition {
  id = "yamaha_dx200",
  name = "Yamaha DX200",
  author = "ObscureRobot [obscurerobot@gmail.com]",
  beta = true,
  content_height = 530,
  Section {
    name = "Front Panel",
    group_vcf,
    group_distortion,
    group_effect,
    group_mixer,
    group_scene,
    group_misc,
    group_lfo,
    group_aeg,
    group_feg,
    group_common,
    group_algorithm,
    group_noise_osc       
  },
  --[[
  Section {
    name = "DX200 Sysex",
    group_dx200_sysex
  },
  ]]--
  Section {
    name = "DX7 Op 1-3",
    group_dx7_op1,
    group_dx7_op2,
    group_dx7_op3
  },
    Section {
    name = "DX7 Op 4-6",
    group_dx7_op4,
    group_dx7_op5,
    group_dx7_op6
  }
}

