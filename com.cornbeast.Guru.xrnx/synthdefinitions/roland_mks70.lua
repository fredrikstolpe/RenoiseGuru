return SynthDefinition {
  id = "roland_mks70",
  name = "Roland MKS-70",
  author = "Cornbeast [cornbeast@cornbeast.com]",
  beta = true,
  Section {
    name = "Tone A",
    sysex_message_template = {0xF0, 0x41, 0x36, "cc", 0x24, 0x20, 0x01, "nn", "vv", 0xF7},
    Group {
      name = "DCO 1",
      Parameter {
        id = "dco1_range",
        name = "Range",
        number = 11,
        default_value = 2,
        items = {"16'","8'","4'","2'"},
        item_values = {0,32,64,96}
      },
      Parameter {
        id = "dco1_waveform",
        name = "Waveform",
        number = 12,
        default_value = 4,
        items = {"Noise","Square","Pulse","Saw"},
        item_values = {0,32,64,96}
      },
      Parameter {
        id = "dco1_tune",
        name = "Tune",
        number = 13,
        default_value = 64
      },
      Parameter {
        id = "dco1_lfo_mod_depth",
        name = "LFO mod depth",
        number = 14,
        default_value = 0
      },
      Parameter {
        id = "dco1_env_mod_depth",
        name = "Env mod depth",
        number = 15,
        default_value = 0
      }
    },
    Group {
      name = "DCO 2",
      Parameter {
        id = "dco2_range",
        name = "Range",
        number = 16,
        default_value = 1,
        items = {"16'","8'","4'","2'"},
        item_values = {0,32,64,96}
      },
      Parameter {
        id = "dco2_waveform",
        name = "Waveform",
        number = 17,
        default_value = 4,
        items = {"Noise","Square","Pulse","Saw"},
        item_values = {0,32,64,96}
      },
      Parameter {
        id = "dco2_crossmod",
        name = "Crossmod",
        number = 18,
        default_value = 1,
        items = {"OFF","SNC 1","SNC 2","XMOD"},
        item_values = {0,32,64,96}
      },
      Parameter {
        id = "dco2_tune",
        name = "Tune",
        number = 19,
        default_value = 64
      },
      Parameter {
        id = "dco2_fine_tune",
        name = "Fine tune",
        number = 20,
        default_value = 77
      },
      Parameter {
        id = "dco2_lfo_mod_depth",
        name = "LFO mod depth",
        number = 21,
        default_value = 6
      },
      Parameter {
        id = "dco2_env_mod_depth",
        name = "Env mod depth",
        number = 22,
        default_value = 0
      }
    },
    Group {
      name = "DCO Env mod",
      Parameter {
        id = "dco_dynamics",
        name = "Dynamics",
        number = 26,
        default_value = 1,
        items = {"OFF","1","2","3"},
        item_values = {0,32,64,96}
      },
      Parameter {
        id = "dco_env_mode",
        name = "Env movde",
        number = 27,
        default_value = 4,
        items = {"2 (inv)","Env 2","1 (inv)","Env 1"},
        item_values = {0,32,64,96}
      }
    },
    Group {
      name = "Mixer",
      Parameter {
        id = "mixer_dco1",
        name = "DCO 1",
        number = 28,
        default_value = 127
      },
      Parameter {
        id = "mixer_dco2",
        name = "DCO 2",
        number = 29,
        default_value = 127
      },
      Parameter {
        id = "mixer_env_mod_depth",
        name = "Env mod",
        number = 30
      },
      Parameter {
        id = "mixer_dynamics",
        name = "Dynamics",
        number = 31,
        items = {"OFF","1","2","3"},
        item_values = {0,32,64,96}
      },
      Parameter {
        id = "mixer_env_mode",
        name = "Env mode",
        number = 32,
        default_value = 4,
        items = {"2 (inv)","Env 2","1 (inv)","Env 1"},
        item_values = {0,32,64,96}
      }
    },
    Group {
      name = "VCF",
      Parameter {
        id = "hpf_cutoff_freq",
        name = "HPF",
        number = 33,
        items = {"0","1","2","3"},
        item_values = {0,32,64,96}
      },
      Parameter {
        id = "vcf_cutoff_freq",
        name = "Cutoff",
        number = 34,
        default_value = 50
      },
      Parameter {
        id = "vcf_resonance",
        name = "Resonance",
        number = 35,
      },
      Parameter {
        id = "vcf_lfo_mod_depth",
        name = "LFO mod",
        number = 36,
      },
      Parameter {
        id = "vcf_env_mod_depth",
        name = "Env mod",
        number = 37,
        default_value = 95
      },
      Parameter {
        id = "vcf_key_follow",
        name = "Key follow",
        number = 38,
        default_value = 113
      },
      Parameter {
        id = "vcf_dynamics",
        name = "Dynamics",
        number = 39,
        default_value = 3,
        items = {"OFF","1","2","3"},
        item_values = {0,32,64,96}
      },
      Parameter {
        id = "vcf_env_mode",
        name = "Env mode",
        number = 40,
        default_value = 4,
        items = {"2 (inv)","Env 2","1 (inv)","Env 1"},
        item_values = {0,32,64,96}
      }
    },
    Group {
      name = "VCA",
      Parameter {
        id = "vca_level",
        name = "Level",
        number = 41,
        default_value = 110
      },
      Parameter {
        id = "vca_dynamics",
        name = "Dynamics",
        number = 42,
        default_value = 3,
        items = {"OFF","1","2","3"},
        item_values = {0,32,64,96}
      },
      Parameter {
        id = "vca_env_mode",
        name = "Env mode",
        number = 58,
        default_value = 2,
        items = {"Gate","Env 2"},
        item_values = {0,64}
      }
    },
    Group {
      name = "LFO",
      Parameter {
        id = "lfo_waveform",
        name = "Waveform",
        number = 44,
        default_value = 3,
        items = {"Random","Square","Sine"},
        item_values = {0,32,64}
      },
      Parameter {
        id = "lfo_delay_time",
        name = "Delay time",
        number = 45,
        default_value = 50
      },
      Parameter {
        id = "lfo_rate",
        name = "Rate",
        number = 46,
        default_value = 92
      },
    },
    Group {
      name = "Envelope 1",
      Parameter {
        id = "env1_attack_time",
        name = "Attack time",
        number = 47
      },
      Parameter {
        id = "env1_decay_time",
        name = "Decay time",
        number = 48,
        default_value = 30
      },
      Parameter {
        id = "env1_sustain_level",
        name = "Sustain level",
        number = 49,
        default_value = 50
      },
      Parameter {
        id = "env1_release_time",
        name = "Release time",
        number = 50,
        default_value = 50
      },
      Parameter {
        id = "env1_key_follow",
        name = "Key follow",
        number = 51,
        default_value = 1,
        items = {"Off","1","2","3"},
        item_values = {0,32,64,96}
      }
    },
    Group {
      name = "Envelope 2",
      Parameter {
        id = "env2_attack_time",
        name = "Attack time",
        number = 52
      },
      Parameter {
        id = "env2_decay_time",
        name = "Decay time",
        number = 53,
        default_value = 34
      },
      Parameter {
        id = "env2_sustain_level",
        name = "Sustain level",
        number = 54,
        default_value = 24
      },
      Parameter {
        id = "env2_release_time",
        name = "Release time",
        number = 55,
        default_value = 50
      },
      Parameter {
        id = "env2_key_follow",
        name = "Key follow",
        number = 56,
        default_value = 1,
        items = {"OFF","1","2","3"},
        item_values = {0,32,64,96}
      }
    },
    Group {
      name = "Chorus",
      Parameter {
        id = "chorus",
        name = "Chorus",
        number = 43,
        default_value = 2,
        items = { "OFF","1","2"},
        item_values = {0,32,64} 
      }
    }
  },
  Section {
    name = "Tone B",
    sysex_message_template = {0xF0, 0x41, 0x36, "cc", 0x24, 0x20, 0x01, "nn", "vv", 0xF7},
    Group {
      name = "DCO 1",
      Parameter {
        id = "tone_b_dco1_range",
        name = "Range",
        number = 11,
        default_value = 2,
        items = {"16'","8'","4'","2'"},
        item_values = {0,32,64,96}
      },
      Parameter {
        id = "tone_b_dco1_waveform",
        name = "Waveform",
        number = 12,
        default_value = 4,
        items = {"Noise","Square","Pulse","Saw"},
        item_values = {0,32,64,96}
      },
      Parameter {
        id = "tone_b_dco1_tune",
        name = "Tune",
        number = 13,
        default_value = 64
      },
      Parameter {
        id = "tone_b_dco1_lfo_mod_depth",
        name = "LFO mod depth",
        number = 14,
        default_value = 0
      },
      Parameter {
        id = "tone_b_dco1_env_mod_depth",
        name = "Env mod depth",
        number = 15,
        default_value = 0
      }
    },
    Group {
      name = "DCO 2",
      Parameter {
        id = "tone_b_dco2_range",
        name = "Range",
        number = 16,
        default_value = 1,
        items = {"16'","8'","4'","2'"},
        item_values = {0,32,64,96}
      },
      Parameter {
        id = "tone_b_dco2_waveform",
        name = "Waveform",
        number = 17,
        default_value = 4,
        items = {"Noise","Square","Pulse","Saw"},
        item_values = {0,32,64,96}
      },
      Parameter {
        id = "tone_b_dco2_crossmod",
        name = "Crossmod",
        number = 18,
        default_value = 1,
        items = {"OFF","SNC 1","SNC 2","XMOD"},
        item_values = {0,32,64,96}
      },
      Parameter {
        id = "tone_b_dco2_tune",
        name = "Tune",
        number = 19,
        default_value = 64
      },
      Parameter {
        id = "tone_b_dco2_fine_tune",
        name = "Fine tune",
        number = 20,
        default_value = 77
      },
      Parameter {
        id = "tone_b_dco2_lfo_mod_depth",
        name = "LFO mod depth",
        number = 21,
        default_value = 6
      },
      Parameter {
        id = "tone_b_dco2_env_mod_depth",
        name = "Env mod depth",
        number = 22,
        default_value = 0
      }
    },
    Group {
      name = "DCO Env mod",
      Parameter {
        id = "tone_b_dco_dynamics",
        name = "Dynamics",
        number = 26,
        default_value = 1,
        items = {"OFF","1","2","3"},
        item_values = {0,32,64,96}
      },
      Parameter {
        id = "tone_b_dco_env_mode",
        name = "Env movde",
        number = 27,
        default_value = 4,
        items = {"2 (inv)","Env 2","1 (inv)","Env 1"},
        item_values = {0,32,64,96}
      }
    },
    Group {
      name = "Mixer",
      Parameter {
        id = "tone_b_mixer_dco1",
        name = "DCO 1",
        number = 28,
        default_value = 127
      },
      Parameter {
        id = "tone_b_mixer_dco2",
        name = "DCO 2",
        number = 29,
        default_value = 127
      },
      Parameter {
        id = "tone_b_mixer_env_mod_depth",
        name = "Env mod",
        number = 30
      },
      Parameter {
        id = "tone_b_mixer_dynamics",
        name = "Dynamics",
        number = 31,
        items = {"OFF","1","2","3"},
        item_values = {0,32,64,96}
      },
      Parameter {
        id = "tone_b_mixer_env_mode",
        name = "Env mode",
        number = 32,
        default_value = 4,
        items = {"2 (inv)","Env 2","1 (inv)","Env 1"},
        item_values = {0,32,64,96}
      }
    },
    Group {
      name = "VCF",
      Parameter {
        id = "tone_b_hpf_cutoff_freq",
        name = "HPF",
        number = 33,
        items = {"0","1","2","3"},
        item_values = {0,32,64,96}
      },
      Parameter {
        id = "tone_b_vcf_cutoff_freq",
        name = "Cutoff",
        number = 34,
        default_value = 50
      },
      Parameter {
        id = "tone_b_vcf_resonance",
        name = "Resonance",
        number = 35,
      },
      Parameter {
        id = "tone_b_vcf_lfo_mod_depth",
        name = "LFO mod",
        number = 36,
      },
      Parameter {
        id = "tone_b_vcf_env_mod_depth",
        name = "Env mod",
        number = 37,
        default_value = 95
      },
      Parameter {
        id = "tone_b_vcf_key_follow",
        name = "Key follow",
        number = 38,
        default_value = 113
      },
      Parameter {
        id = "tone_b_vcf_dynamics",
        name = "Dynamics",
        number = 39,
        default_value = 3,
        items = {"OFF","1","2","3"},
        item_values = {0,32,64,96}
      },
      Parameter {
        id = "tone_b_vcf_env_mode",
        name = "Env mode",
        number = 40,
        default_value = 4,
        items = {"2 (inv)","Env 2","1 (inv)","Env 1"},
        item_values = {0,32,64,96}
      }
    },
    Group {
      name = "VCA",
      Parameter {
        id = "tone_b_vca_level",
        name = "Level",
        number = 41,
        default_value = 110
      },
      Parameter {
        id = "tone_b_vca_dynamics",
        name = "Dynamics",
        number = 42,
        default_value = 3,
        items = {"OFF","1","2","3"},
        item_values = {0,32,64,96}
      },
      Parameter {
        id = "tone_b_vca_env_mode",
        name = "Env mode",
        number = 58,
        default_value = 2,
        items = {"Gate","Env 2"},
        item_values = {0,64}
      }
    },
    Group {
      name = "LFO",
      Parameter {
        id = "tone_b_lfo_waveform",
        name = "Waveform",
        number = 44,
        default_value = 3,
        items = {"Random","Square","Sine"},
        item_values = {0,32,64}
      },
      Parameter {
        id = "tone_b_lfo_delay_time",
        name = "Delay time",
        number = 45,
        default_value = 50
      },
      Parameter {
        id = "tone_b_lfo_rate",
        name = "Rate",
        number = 46,
        default_value = 92
      },
    },
    Group {
      name = "Envelope 1",
      Parameter {
        id = "tone_b_env1_attack_time",
        name = "Attack time",
        number = 47
      },
      Parameter {
        id = "tone_b_env1_decay_time",
        name = "Decay time",
        number = 48,
        default_value = 30
      },
      Parameter {
        id = "tone_b_env1_sustain_level",
        name = "Sustain level",
        number = 49,
        default_value = 50
      },
      Parameter {
        id = "tone_b_env1_release_time",
        name = "Release time",
        number = 50,
        default_value = 50
      },
      Parameter {
        id = "tone_b_env1_key_follow",
        name = "Key follow",
        number = 51,
        default_value = 1,
        items = {"Off","1","2","3"},
        item_values = {0,32,64,96}
      }
    },
    Group {
      name = "Envelope 2",
      Parameter {
        id = "tone_b_env2_attack_time",
        name = "Attack time",
        number = 52
      },
      Parameter {
        id = "tone_b_env2_decay_time",
        name = "Decay time",
        number = 53,
        default_value = 34
      },
      Parameter {
        id = "tone_b_env2_sustain_level",
        name = "Sustain level",
        number = 54,
        default_value = 24
      },
      Parameter {
        id = "tone_b_env2_release_time",
        name = "Release time",
        number = 55,
        default_value = 50
      },
      Parameter {
        id = "tone_b_env2_key_follow",
        name = "Key follow",
        number = 56,
        default_value = 1,
        items = {"OFF","1","2","3"},
        item_values = {0,32,64,96}
      }
    },
    Group {
      name = "Chorus",
      Parameter {
        id = "tone_b_chorus",
        name = "Chorus",
        number = 43,
        default_value = 2,
        items = { "OFF","1","2"},
        item_values = {0,32,64} 
      }
    }
  },
  Section {
    name = "Patch",
    sysex_message_template = {0xF0, 0x41, 0x36, "cc", 0x24, 0x30, 0x01, "nn", "vv", 0xF7},
    Group {
      name = "Lower (Tone B)",
      Parameter {
        id = "lower_split_point",
        name = "Split point",
        number = 21,
        min_value = 21,
        max_value = 108
      },
      --[[Parameter {
        id = "lower_tone_number",
        name = "Tone number",
        number = 38,
        max_value = 99
      },--]]
      Parameter {
        id = "lower_chromatic_shift",
        name = "Chromatic shift",
        number = 39,
        default_value = 25,
        items = {
          "- 24 semi tones","- 23 semi tones","- 22 semi tones","- 21 semi tones","- 20 semi tones","- 19 semi tones",
          "- 18 semi tones","- 17 semi tones","- 16 semi tones","- 15 semi tones","- 14 semi tones","- 13 semi tones",
          "- 12 semi tones","- 11 semi tones","- 10 semi tones","- 9 semi tones","- 8 semi tones","- 7 semi tones",
          "- 6 semi tones","- 5 semi tones","- 4 semi tones","- 3 semi tones","- 2 semi tones","- 1 semi tones",
          "0 semi tones",
          "+ 1 semi tones","+ 2 semi tones","+ 3 semi tones","+ 4 semi tones","+ 5 semi tones","+ 6 semi tones",
          "+ 7 semi tones","+ 8 semi tones","+ 9 semi tones","+ 10 semi tones","+ 11 semi tones","+ 12 semi tones",
          "+ 13 semi tones","+ 14 semi tones","+ 15 semi tones","+ 16 semi tones","+ 17 semi tones","+ 18 semi tones",
          "+ 19 semi tones","+ 20 semi tones","+ 21 semi tones","+ 22 semi tones","+ 23 semi tones","+ 24 semi tones",          
        },
        item_values = {
          104,105,106,107,108,109,
          110,111,112,113,114,115,
          116,117,118,119,120,121,
          122,123,124,125,126,127,
          0,
          1,2,3,4,5,6,
          7,8,9,10,11,12,
          13,14,15,16,17,18,
          19,20,21,22,23,24
        }        
      },
      Parameter {
        id = "lower_key_assign",
        name = "Key assign",
        number = 40,
        items = {"Poly-1","Unison-1","Mono-1","Poly-2","Unison-2 ","Mono-2"},
        item_values = {0,1,2,4,5,6},
        gui_type = "dropdown"
      },
      Parameter {
        id = "lower_unison_detune",
        name = "Unison detune",
        number = 41
      },
      Parameter {
        id = "lower_lfo_mod_depth",
        name = "LFO mod depth",
        number = 43
      },
      Parameter {
        id = "lower_hold",
        name = "Hold",
        number = 42,
        items = {"OFF","ON"}
      },
      Parameter {
        id = "lower_portamento",
        name = "Portamento",
        number = 44,
        items = {"OFF","ON"}
      },
      Parameter {
        id = "lower_bender",
        name = "Bender",
        number = 45,
        items = {"OFF","ON"}
      }
    },
    Group {
      name = "Upper (Tone A)",
      Parameter {
        id = "upper_split_point",
        name = "Split point",
        number = 20,
        min_value = 21,
        max_value = 108
      },
      --[[Parameter {
        id = "upper_tone_number",
        name = "Tone number",
        number = 29,
        max_value = 99
      },--]]
      Parameter {
        id = "upper_chromatic_shift",
        name = "Chromatic shift",
        number = 30,
        default_value = 25,
        items = {
          "- 24 semi tones","- 23 semi tones","- 22 semi tones","- 21 semi tones","- 20 semi tones","- 19 semi tones",
          "- 18 semi tones","- 17 semi tones","- 16 semi tones","- 15 semi tones","- 14 semi tones","- 13 semi tones",
          "- 12 semi tones","- 11 semi tones","- 10 semi tones","- 9 semi tones","- 8 semi tones","- 7 semi tones",
          "- 6 semi tones","- 5 semi tones","- 4 semi tones","- 3 semi tones","- 2 semi tones","- 1 semi tones",
          "0 semi tones",
          "+ 1 semi tones","+ 2 semi tones","+ 3 semi tones","+ 4 semi tones","+ 5 semi tones","+ 6 semi tones",
          "+ 7 semi tones","+ 8 semi tones","+ 9 semi tones","+ 10 semi tones","+ 11 semi tones","+ 12 semi tones",
          "+ 13 semi tones","+ 14 semi tones","+ 15 semi tones","+ 16 semi tones","+ 17 semi tones","+ 18 semi tones",
          "+ 19 semi tones","+ 20 semi tones","+ 21 semi tones","+ 22 semi tones","+ 23 semi tones","+ 24 semi tones",          
        },
        item_values = {
          104,105,106,107,108,109,
          110,111,112,113,114,115,
          116,117,118,119,120,121,
          122,123,124,125,126,127,
          0,
          1,2,3,4,5,6,
          7,8,9,10,11,12,
          13,14,15,16,17,18,
          19,20,21,22,23,24
        }
      },
      Parameter {
        id = "upper_key_assign",
        name = "Key assign",
        number = 31,
        items = {"Poly-1","Unison-1","Mono-1","Poly-2","Unison-2 ","Mono-2"},
        item_values = {0,1,2,4,5,6},
        gui_type = "dropdown"
      },
      Parameter {
        id = "upper_unison_detune",
        name = "Unison detune",
        number = 32
      },
      Parameter {
        id = "upper_lfo_mod_depth",
        name = "LFO mod depth",
        number = 34
      },
      Parameter {
        id = "upper_hold",
        name = "Hold",
        number = 33,
        items = {"OFF","ON"}
      },
      Parameter {
        id = "upper_portamento",
        name = "Portamento",
        number = 35,
        items = {"OFF","ON"}
      },
      Parameter {
        id = "upper_bender",
        name = "Bender",
        number = 36,
        items = {"OFF","ON"}
      }
    },
Group {
      name = "Patch",
      Parameter {
        id = "total_volumne",
        name = "Master volume",
        number = 25
      },
      Parameter {
        id = "ul_balance",
        name = "U/L balance",
        number = 18,
        default_value = 64
      },
      Parameter {
        id = "after_touch_vibrato",
        name = "After touch vibrato",
        number = 26
      },
      Parameter {
        id = "after_touch_brilliance",
        name = "After touch brilliance",
        number = 27
      },
      Parameter {
        id = "after_touch_volume",
        name = "After touch volume",
        number = 28
      },
      Parameter {
        id = "dual_detune",
        name = "Dual detune",
        number = 19
      },
      Parameter {
        id = "portamento_time",
        name = "Portamento time",
        number = 22
      },
      Parameter {
        id = "chase_level",
        name = "Chase level",
        number = 47
      },
      Parameter {
        id = "chase_mode",
        name = "Chase mode",
        number = 48,
        items = {"A-B","A-B-B-","A-B-A-"}
      },
      Parameter {
        id = "chase_time",
        name = "Chase time",
        number = 49
      },
      Parameter {
        id = "chase_play",
        name = "Chase play",
        number = 50,
        items = {"OFF","ON"}
      }
      --[[Todo: Parameter {
        id = "bend_range",
        name = "Bend range",
        number = 23,
        ms_nibble_number = 52,
        items = {"2","3","4","7","12"},
        item_values = {0,32,64,96,128}
      },
      Parameter {
        id = "key_mode",
        name = "Key mode",
        number = 24, --TODO
        lsb_number = 51,
        items = {"Dual","Split","A whole","B whole","X-fade", "Touch voice select"},
        item_values = {0,1,2,3,4,8},
        gui_type = "dropdown"
      }]]--
    }
  }  
}
