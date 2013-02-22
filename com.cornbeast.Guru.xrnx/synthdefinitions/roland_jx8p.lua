return SynthDefinition {
  id = "roland_jx8p",
  name = "Roland JX-8P",
  author = "Cornbeast [cornbeast@cornbeast.com]",
  beta = false,
  content_height = 565,
  Section { 
    sysex_message_template = {0xF0, 0x41, 0x36, "cc", 0x21, 0x20, 0x01, "nn", "vv", 0xF7},
    Group {
      name = "DCO 1",
      Parameter {
        id = "dco1_range",
        name = "Range",
        number = 11,
        default_value = 2,
        items = {"16'","8'","4'","2'"},
        item_values = {0,32,64,96},
        randomize_max = 3
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
        default_value = 64,
        display_min_value = -64,
        display_max_value = 63,
        randomize_min = 64,
        randomize_max = 64
      },
      Parameter {
        id = "dco1_lfo_mod_depth",
        name = "LFO mod depth",
        number = 14,
        default_value = 0,
        randomize_max = 10
      },
      Parameter {
        id = "dco1_env_mod_depth",
        name = "Env mod depth",
        number = 15,
        default_value = 0,
        randomize_max = 10
      }
    },
    Group {
      name = "DCO 2",
      Parameter {
        id = "dco2_range",
        name = "Range",
        number = 16,
        items = {"16'","8'","4'","2'"},
        item_values = {0,32,64,96},
        randomize_max = 3
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
        items = {"OFF","SNC 1","SNC 2","XMOD"},
        item_values = {0,32,64,96}
      },
      Parameter {
        id = "dco2_tune",
        name = "Tune",
        number = 19,
        default_value = 64,
        display_min_value = -64,
        display_max_value = 63,
        randomize_min = 64,
        randomize_max = 64        
      },
      Parameter {
        id = "dco2_fine_tune",
        name = "Fine tune",
        number = 20,
        default_value = 77,
        display_min_value = -64,
        display_max_value = 63,
        randomize_min = 44,
        randomize_max = 84        
      },
      Parameter {
        id = "dco2_lfo_mod_depth",
        name = "LFO mod depth",
        number = 21,
        default_value = 6,
        randomize_max = 10
      },
      Parameter {
        id = "dco2_env_mod_depth",
        name = "Env mod depth",
        number = 22,
        default_value = 0,
        randomize_max = 10
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
        default_value = 50,
        randomize_min = 20
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
        item_values = {0,32,64,96},
        randomize_min = 4
      }
    },
    Group {
      name = "VCA",
      Parameter {
        id = "vca_level",
        name = "Level",
        number = 41,
        default_value = 110,
        randomize_min = 100
      },
      Parameter {
        id = "vca_dynamics",
        name = "Dynamics",
        number = 42,
        default_value = 3,
        items = {"OFF","1","2","3"},
        item_values = {0,32,64,96},
        randomize_max = 3
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
      name = "Chorus",
      Parameter {
        id = "chorus",
        name = "Chorus",
        number = 43,
        default_value = 2,
        items = { "OFF","1","2"},
        item_values = {0,32,64} 
      }
    },    
    Group {
      name = "Envelope 1",
      Parameter {
        id = "env1_attack_time",
        name = "Attack time",
        number = 47,
        randomize_max = 20,
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
        default_value = 50,
        randomize_max = 100,
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
        number = 52,
        randomize_max = 20,
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
        default_value = 50,
        randomize_max = 100
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
      sysex_message_template = {0xF0, 0x41, 0x36, "cc", 0x21, 0x30, 0x01, "nn", "vv", 0xF7},
      name = "Patch",
      Parameter {
        id = "bend_range",
        name = "Bend range",
        number = 0,
        items = {"2 semi","3 semi","4 semi","7 semi"},
        item_values = {0,32,64,96}
      },
      Parameter {
        id = "portamento_time",
        name = "Portamento time",
        number = 1,
      },
      Parameter {
        id = "portamento",
        name = "Portamento",
        number = 2,
        items = {"OFF","ON"},
        item_values = {0,64}
      },
      Parameter {
        id = "assign_mode",
        name = "Assign mode",
        number = 3,
        items = {"Poly-1","Unison-1","Solo-1","Poly-2","Unison-2","Solo-2"},
        item_values = {0,1,2,4,5,6},
        gui_type = "dropdown"
      },
      Parameter {
        id = "after_touch",
        name = "After touch",
        number = 4,
        items = {"OFF",
          "Vibrato",
          "Brilliance",
          "Vibrato + Brilliance",
          "Volume",
          "Vibrato + Volume",
          "Brilliance + Volume",
          "Vibrato + Brilliance + Volume"},
        gui_type = "dropdown"
      },
      Parameter {
        id = "bend_lfo_depth",
        name = "Bend LFO depth",
        number = 5
      },
      Parameter {
        id = "unison_detune",
        name = "Unison detune",
        number = 6
      }--[[,
      Parameter {
        id = "tone_number",
        name = "Tone number",
        number = 7,
        max_value = 31
      },
      Parameter {
        id = "bank_number",
        name = "Bank number",
        number = 8,
        items = {"1","2","3","4"}
      }]]--     
    }
  }
}

