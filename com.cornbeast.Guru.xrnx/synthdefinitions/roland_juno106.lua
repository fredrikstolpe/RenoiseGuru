function switches_0x10(parameter)
    local synth_definition = parameter.synth_definition
    return synth_definition.parameters["dco_range"]:value()
         + synth_definition.parameters["dco_pulse"]:value() 
         + synth_definition.parameters["dco_tri"]:value() 
         + synth_definition.parameters["chorus_type"]:value()
end

function switches_0x11(parameter)
    local synth_definition = parameter.synth_definition
    return synth_definition.parameters["dco_pwm_lfo"]:value()
         + synth_definition.parameters["vca_env_gate"]:value()
         + synth_definition.parameters["vcf_polarity"]:value()
         + synth_definition.parameters["hpf"]:value()
end

local group_lfo = Group {
    name = "LFO",
    Parameter {
        id = "lfo_rate",
        name = "Rate",
        number = 0x00,
        default_value = 0
    },
    Parameter {
        id = "lfo_delay_time",
        name = "Delay Time",
        number = 0x01,
        default_value = 0
    }
}

local group_dco = Group {
    name = "DCO",
    Parameter {
        id = "dco_range",
        name = "Range",
        number = 0x10,
        items = {"16'","8'","4'"},
        item_values = {1, 2, 4},
        default_value = 1,
        value_callback = switches_0x10
    },
    Parameter {
        id = "dco_lfo",
        name = "LFO",
        number = 0x02,
        default_value = 0
    },
    Parameter {
        id = "dco_pwm",
        name = "PWM",
        number = 0x03,
        default_value = 0
    },
    Parameter {
        id = "dco_pwm_lfo",
        name = "PWM = LFO",
        number = 0x11,
        items = {"On", "Off"},
        item_values = {0, 1},
        default_value = 2,
        value_callback = switches_0x11
    },
    Parameter {
        id = "dco_pulse",
        name = "Pulse",
        number = 0x10,
        items = {"On", "Off"},
        item_values = {8, 0},
        default_value = 1,
        value_callback = switches_0x10
    },
    Parameter {
        id = "dco_tri",
        name = "Triangle",
        number = 0x10,
        items = {"On", "Off"},
        item_values = {16, 0},
        default_value = 1,
        value_callback = switches_0x10
    },
    Parameter {
        id = "dco_sub",
        name = "Sub",
        number = 0x0F,
        default_value = 64
    },
    Parameter {
        id = "dco_noise",
        name = "Noise",
        number = 0x04,
        default_value = 0
    }    
}

local group_hpf = Group {
    name = "HPF",
    Parameter {
        id = "hpf",
        name = "Freq",
        number = 0x11,
        items = {"0", "1", "2", "3"},
        item_values = {24, 16, 8, 0},
        default_value = 1,
        value_callback = switches_0x11
    }
}

local group_vcf = Group {
    name = "VCF",
    Parameter {
        id = "vcf_freq",
        name = "Freq",
        number = 0x05,
        default_value = 127
    },
    Parameter {
        id = "vcf_res",
        name = "Res",
        number = 0x06,
        default_value = 0
    },
    Parameter {
        id = "vcf_polarity",
        name = "Polarity",
        number = 0x11,
        items = {"+", "-"},
        item_values = {0, 2},
        default_value = 1,
        value_callback = switches_0x11
    },
    Parameter {
        id = "vcf_env",
        name = "Env",
        number = 0x07,
        default_value = 0
    },
    Parameter {
        id = "vcf_lfo",
        name = "LFO",
        number = 0x08,
        default_value = 0
    },
    Parameter {
        id = "vcf_kybd",
        name = "Kybd",
        number = 0x09,
        default_value = 0
    }
}

local group_vca = Group {
    name = "VCA",
    Parameter {
        id = "vca_env_gate",
        name = "ENV/Gate",
        number = 0x11,
        items = {"ENV", "Gate"},
        item_values = {0, 4},
        default_value = 1,
        value_callback = switches_0x11
    },
    Parameter {
        id = "vca_level",
        name = "Level",
        number = 0x0A,
        default_value = 64
    }
}

local group_env = Group {
    name = "ENV",
    Parameter {
        id = "env_attack",
        name = "Attack",
        number = 0x0B,
        default_value = 32
    },
    Parameter {
        id = "env_decay",
        name = "Decay",
        number = 0x0C,
        default_value = 64
    },
    Parameter {
        id = "env_sustain",
        name = "Sustain",
        number = 0x0D,
        default_value = 127
    },
    Parameter {
        id = "env_release",
        name = "Release",
        number = 0x0E,
        default_value = 32
    }
}

local group_chorus = Group {
    name = "Chorus",
    Parameter {
        id = "chorus_type",
        name = "Type",
        number = 0x10,
        items = {"Off", "I", "II"},
        item_values = {32, 64, 0},
        default_value = 2,
        value_callback = switches_0x10
    }
}

return SynthDefinition {
    id = "roland_juno_106",
    name = "Roland Juno 106",
    author = "Local Mind Provider <naaina@localmindprovider.com>",
    content_height = 340,
    Section {
        sysex_message_template = {0xF0, 0x41, 0x32, "cc", "nn", "vv", 0xF7},
        group_lfo,
        group_dco,
        group_hpf,
        group_vcf,
        group_vca,
        group_env,
        group_chorus
    }  
}
