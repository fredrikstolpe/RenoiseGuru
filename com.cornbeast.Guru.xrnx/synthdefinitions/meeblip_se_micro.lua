-- Global Group
local group_global = Group {
  name = "Global",

  Parameter {
    id = "portamento",
    name = "Portamento",
    number = 53,
    type = "cc",
    default_value = 32,
  },

  Parameter {
    id = "distortion",
    name = "Distortion",
    number = 69,
    type = "cc",
  items = {"Off","On"},
  item_values = {0,127},
  default_value = 1,
  },

  Parameter {
    id = "anti_alias",
    name = "Anti Alias",
    number = 72,
    type = "cc",
  items = {"Off","On"},
  item_values = {0,127},
  default_value = 1,
  },

  Parameter {
    id = "fm",
    name = "FM",
    number = 65,
    type = "cc",
  items = {"Off","On"},
  item_values = {0,127},
  default_value = 1,
  },
  
  Parameter {
    id = "osc_detune",
    name = "Detune",
    number = 55,
    type = "cc",
    default_value = 64,
  },
  
}

-- Osc group
local group_osc = Group {
  name = "Osc",

  
  Parameter {
  id = "osc_a_wave",
  name = "Osc A Wave",
  number = 79,
    type = "cc",
  items = {"Sawtooth","PWM"},
  item_values = {0,127},
  default_value = 1,
  },
  
  Parameter {
    id = "pw_pwm_rate",
    name = "PW / PWM Rate",
    number = 54,
    type = "cc",
    default_value = 0,
  },
  
  Parameter {
  id = "pwm_sweep",
  name = "PWM Sweep",
  number = 78,
    type = "cc",
  items = {"Pulse","PWM"},
  item_values = {0,127},
  default_value = 1,
  },
  
  Parameter {
  id = "osc_a_noise",
  name = "Osc A Noise",
  number = 77,
    type = "cc",
  items = {"Off","On"},
  item_values = {0,127},
  default_value = 1,
  },
  
  Parameter {
  id = "osc_b_enable",
  name = "Osc B",
  number = 74,
    type = "cc",
  items = {"Off","On"},
  item_values = {0,127},
  default_value = 1,
  },
  
  Parameter {
  id = "osc_b_wave",
  name = "Osc B Wave",
  number = 75,
    type = "cc",
  items = {"Triangle","Square"},
  item_values = {0,127},
  default_value = 1,
  },
  
  Parameter {
  id = "osc_b_octave",
  name = "Osc B Octave",
  number = 73,
    type = "cc",
  items = {"Normal","Up"},
  item_values = {0,127},
  default_value = 1,
  },

}

-- Filter group
local group_filter = Group {
  name = "Filter",
  
  Parameter {
  id = "filter_mode",
  name = "Filter Mode",
  number = 68,
    type = "cc",
  items = {"LP","HP"},
  item_values = {0,127},
  default_value = 1,
  },
  
  Parameter {
  id = "filter_cutoff",
  name = "Cutoff",
  number = 49,
    type = "cc",
  default_value = 64,
  },
  
  Parameter {
  id = "filter_res",
  name = "Resonance",
  number = 48,
    type = "cc",
  default_value = 0,
  },
  
  Parameter {
  id = "filter_env",
  name = "Env Amount",
  number = 52,
    type = "cc",
  default_value = 64,
  },

}

-- LFO group
local group_lfo = Group {
  name = "LFO",
  
  Parameter {
  id = "lfo_enable",
  name = "LFO",
  number = 70,
    type = "cc",
  items = {"Off","On"},
  item_values = {0,127},
  default_value = 1,
  },
  
  Parameter {
  id = "lfo_frequency",
  name = "Frequency",
  number = 50,
    type = "cc",
  default_value = 64,
  },
  
  Parameter {
  id = "lfo_level",
  name = "Level",
  number = 51,
    type = "cc",
  default_value = 0,
  },
  
  Parameter {
  id = "lfo_wave",
  name = "Wave",
  number = 67,
    type = "cc",
  items = {"Triangle","Square"},
  item_values = {0,127},
  default_value = 1,
  },
  
  Parameter {
  id = "lfo_random",
  name = "Random",
  number = 66,
    type = "cc",
  items = {"Off","On"},
  item_values = {0,127},
  default_value = 1,
  },
  
  Parameter {
  id = "lfo_destination",
  name = "Destination",
  number = 71,
    type = "cc",
  items = {"Filter","Oscillator"},
  item_values = {0,127},
  default_value = 1,
  },

}

--  Envs group
local group_envs = Group {
  name = "Env",
  
  Parameter {
  id = "filter_attack",
  name = "Filter Attack",
  number = 59,
    type = "cc",
  default_value = 0,
  },
  
  Parameter {
  id = "filter_decay",
  name = "Filter Decay",
  number = 58,
    type = "cc",
  default_value = 64,
  },
  
  Parameter {
  id = "amp_attack",
  name = "Amp Attack",
  number = 61,
    type = "cc",
  default_value = 0,
  },
  
  Parameter {
  id = "amp_decay",
  name = "Amp Decay",
  number = 60,
    type = "cc",
  default_value = 64,
  },
  
  Parameter {
  id = "env_sustain",
  name = "Sustain",
  number = 76,
    type = "cc",
  items = {"Off","On"},
  item_values = {0,127},
  default_value = 1,
  },
  
}

-- Synth definition
return SynthDefinition {
  id = "meeblip_se_and_micro",
  name = "Meeblip SE and Micro",
  author = "bbarham@gmail.com",
  beta = false,
  delay_between_midi_messages = 10,
  content_height = 340,
  Section {
    group_osc,
    group_filter,
    group_lfo,
    group_envs,
    group_global
  }
}
