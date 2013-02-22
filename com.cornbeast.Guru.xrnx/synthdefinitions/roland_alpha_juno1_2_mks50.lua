local group_lfo = Group {
  name = "LFO",
  Parameter {
    id = "lfo_rate",
    name = "Rate",
    number = 24
  },
  Parameter {
    id = "lfo_delay_time",
    name = "Delay",
    number = 25
  }
}

local group_dco = Group {
  name = "DCO",
  Parameter {
    id = "dco_range",
    name = "Range",
    number = 6,
    items = {"4'","8'","16'","32'"}
  },
  Parameter {
    id = "dco_lfo_mod_depth",
    name = "LFO mod depth",
    number = 11
  },
  Parameter {
    id = "dco_env_mod_depth",
    name = "Env mod depth",
    number = 12
  },
  Parameter {
    id = "dco_env_mode",
    name = "Env mode",
    number = 0,
    items = {"Normal","Inverted","Normal with dynamics","Inverted with dynamics"},
    gui_type = "dropdown"
  },
  Parameter {
    id = "dco_after_depth",
    name = "Aftertouch",
    number = 13
  },
  Parameter {
    id = "dco_waveform_pulse",
    name = "Pulse waveform",
    number = 3,
    items = {"OFF","1","2","3"},
    default_value = 2,
  },
  Parameter {
    id = "dco_waveform_saw",
    name = "Saw waveform",
    number = 4,
    items = {"OFF","1","2","3","4","5"}
  },
  Parameter {
    id = "dco_waveform_sub",
    name = "Sub waveform",
    number = 5,
    items = {"0","1","2","3","4","5"}
  },
  Parameter {
    id = "dco_sub_level",
    name = "Sub level",
    number = 7,
    items = {"0","1","2","3"}
  },
  Parameter {
    id = "dco_noise_level",
    name = "Noise level",
    number = 8,
    items = {"0","1","2","3"}
  },
  Parameter {
    id = "dco_pwm_depth",
    name = "PWM",
    number = 14
  },
  Parameter {
    id = "dco_pwm_rate",
    name = "PWM rate",
    number = 15
  }
}

local group_vca = Group {
  name = "VCA",
  Parameter {
    id = "vca_level",
    name = "Level",
    number = 22,
    default_value = 127
  },
  Parameter {
    id = "vca_env_mode",
    name = "Env mode",
    number = 2,
    items = {"Envelope","Gate","Envelope with dynamics","Gate with dynamics"},
    gui_type = "dropdown"
  },
  Parameter {
    id = "vca_after_depth",
    name = "Aftertouch",
    number = 23
  }
}

local group_vcf = Group {
  name = "VCF",
  Parameter {
    id = "hpf_cutoff_freq",
    name = "HPF",
    number = 9,
    items = {"0","1","2","3"}
  },
  Parameter {
    id = "vcf_cutoff_freq",
    name = "Cutoff",
    number = 16,
    default_value = 80,
  },
  Parameter {
    id = "vcf_resonance",
    name = "Resonance",
    number = 17
  },
  Parameter {
    id = "vcf_lfo_mod_depth",
    name = "LFO mod",
    number = 18
  },
  Parameter {
    id = "vcf_env_mod_depth",
    name = "Env mod",
    number = 19,
    default_value = 50,
  },
  Parameter {
    id = "vcf_env_mode",
    name = "Env mode",
    number = 1,
    items = {"Normal","Inverted","Normal with dynamics","Inverted with dynamics"},
    gui_type = "dropdown"
  },
  Parameter {
    id = "vcf_key_follow",
    name = "Key follow",
    number = 20
  },
  Parameter {
    id = "vcf_after_depth",
    name = "Aftertouch",
    number = 21
  },
}

local group_chorus = Group {
  name = "Chorus",
  Parameter {
    id = "chorus",
    name = "Chorus",
    number = 10,
    items = {"Off","On"},
    default_value = 2,
  },
  Parameter {
    id = "chorus_rate",
    name = "Rate",
    number = 34,
    default_value = 80,
  }
}

local group_envelope = Group {
  name = "Envelope",
  Parameter {
    id = "env_attack_time",
    name = "Attack time",
    number = 26,

  },
  Parameter {
    id = "env_attack_level",
    name = "Attack level",
    number = 27
  },
  Parameter {
    id = "env_break_time",
    name = "Break time",
    number = 28
  },
  Parameter {
    id = "env_break_level",
    name = "Break level",
    number = 29
  },
  Parameter {
    id = "env_decay_time",
    name = "Decay time",
    number = 30,
    default_value = 30
  },
  Parameter {
    id = "env_sustain_level",
    name = "Sustain level",
    number = 31,
    default_value = 50
  },
  Parameter {
    id = "env_release_time",
    name = "Release time",
    number = 32,
    default_value = 50
  },
  Parameter {
    id = "env_key_follow",
    name = "Key follow",
    number = 33
  }
}

local group_bender_range = Group {
  name = "Bender range",
  Parameter {
    id = "bender_range",
    name = "Bender range",
    number = 35,
    max_value = 12
  }
}

return SynthDefinition {
  name = "roland_alpha_juno_1_juno_2_and_mks50",
  name = "Roland Alpha Juno 1, Juno 2 and MKS-50",
  author = "Cornbeast [cornbeast@cornbeast.com]",
  beta = false,
  Section {
    sysex_message_template = {0xF0, 0x41, 0x36, "cc", 0x23, 0x20, 0x01, "nn", "vv", 0xF7},
    group_dco,
    group_vca,
    group_bender_range, 
    group_vcf,
    group_envelope,
    group_lfo,
    group_chorus,
  }
}
