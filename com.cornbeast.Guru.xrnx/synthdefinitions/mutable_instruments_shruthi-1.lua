local group_osc1 = Group {
  name = "Oscillator 1",
  Parameter {
    id = "osc1_shape",
    name = "Shape",
    type = "nrpn",
    items = {"none", "saw","square","triangle","zsaw","zreso","ztri","zpulse","zsync","pad","fm","waves","tampur","digitl","metall","bowed","slap","organ","male","user","8bits","crush","pwm","noise","vowel","belish","polatd","cello","clpswp","female","fmtvoc","frmnt2","res3hp","electp","vibes"},
    default_value = 2,
    gui_type = "dropdown",
    number = 0
  },
  Parameter {
    id = "osc1_param",
    name = "Parameter",
    type = "cc",
    number = 21
  },
  Parameter {
    id = "osc1_range",
    name = "Range",
    default_value = 64,
    display_min_value = -24,
    display_max_value = 24,    
    type = "cc",
    number = 22
  },
  Parameter {
    id = "sub_shape",
    name = "SubOscillator Shape",
    items = {"square 1","triangle 1","pulse 1","square 2","triangle 2","pulse 2","click","glitch","blow","metal","pop"},
    default_value = 1,
    gui_type = "dropdown",
    type = "nrpn",
    number = 11
  }
}

local group_osc2 = Group {
  name = "Oscillator 2",
  Parameter {
    id = "osc2_shape",
    name = "Shape",
    type = "nrpn",
    items = {"none", "saw","square","triangle","zsaw","zreso","ztri","zpulse","zsync","pad","fm","waves","tampur","digitl","metall","bowed","slap","organ","male","user","8bits","crush","pwm","noise","vowel","belish","polatd","cello","clpswp","female","fmtvoc","frmnt2","res3hp","electp","vibes"},
    default_value = 1,
    gui_type = "dropdown",
    number = 4
  },
  Parameter {
    id = "osc2_param",
    name = "Parameter",
    type = "cc",
    number = 25
  },
  Parameter {
    id = "osc2_range",
    name = "Range",
    default_value = 64,
    display_min_value = -24,
    display_max_value = 24, 
    type = "cc",
    number = 26
  },
  Parameter {
    id = "osc2_detune",
    name = "Detune",
    type = "cc",
    number = 27
  }
}



local group_mixer = Group {
  name = "Mixer",
  Parameter {
    id = "mix_op",
    name = "Operator",
    type = "nrpn",
    items = {"sum","sync","ring","xor","fuzz",">>4",">>8","fold","bits","duo","2steps","4steps","8steps","seqmix"},
    default_value = 1,
    gui_type = "dropdown",
    number = 3
  },
  Parameter {
    id = "mix_oscmix",
    name = "Oscillator Balance",
    default_value = 0,
    type = "cc",
    number = 29
  },
  Parameter {
    id = "sub_level",
    name = "SubOscillator Level",
    type = "cc",
    default_value = 0,
    number = 30
  },
  Parameter {
    id = "mix_noise",
    name = "Noise Level",
    type = "cc",
    default_value = 0,
    number = 31
  }
}

local group_lfo1 = Group {
  name = "LFO 1",
  Parameter {
    id = "lfo1_shape",
    name = "Shape",
    items = {"triangle","square","sample&hold","ramp","step","wave 1","wave 2","wave 3","wave 4","wave 5","wave 6","wave 7","wave 8","wave 9","wave 10","wave 11","wave 12","wave 13","wave 14","wave 15","wave 16"},
    default_value = 1,
    gui_type = "dropdown",
    type = "nrpn",
    number = 24
  },
  Parameter {
    id = "lfo1_rate",
    name = "Rate",
    type = "cc",
    number = 113
  },
  Parameter {
    id = "lfo1_attack",
    name = "Attack",
    type = "cc",
    number = 114
  },
  Parameter {
    id = "lfo1_mode",
    name = "Mode",
    items = {"free","slave","master"},
    type = "nrpn",
    number = 27
  }
}

local group_lfo2 = Group {
  name = "LFO 2",
  Parameter {
    id = "lfo2_shape",
    name = "Shape",
    items = {"triangle","square","sample&hold","ramp","step","wave 1","wave 2","wave 3","wave 4","wave 5","wave 6","wave 7","wave 8","wave 9","wave 10","wave 11","wave 12","wave 13","wave 14","wave 15","wave 16"},
    default_value = 1,
    gui_type = "dropdown",
    type = "nrpn",
    number = 28
  },
  Parameter {
    id = "lfo2_rate",
    name = "Rate",
    type = "cc",
    number = 117
  },
  Parameter {
    id = "lfo2_attack",
    name = "Attack",
    type = "cc",
    number = 118
  },
  Parameter {
    id = "lfo2_mode",
    name = "Mode",
    items = {"free","slave","master"},
    type = "nrpn",
    number = 31
  }
}


local group_filter = Group {
  name = "Filter",
  Parameter {
    id = "filt_cutoff",
    name = "Cutoff",
    type = "cc",
    default_value = 64,
    number = 14
  },
  Parameter {
    id = "filt_reso",
    name = "Resonance",
    type = "cc",
    default_value = 0,
    number = 15
  },
  Parameter {
    id = "filt_env",
    name = "Envelope -> Cutoff",
    type = "cc",
    default_value = 32,
    number = 102
  },
  Parameter {
    id = "filt_lfo",
    name = "LFO -> Cutoff",
    type = "cc",
    default_value = 0,
    number = 103
  }
}

local group_env1 = Group {
  name = "Envelope 1",
  Parameter {
    id = "env1_attack",
    name = "Attack",
    type = "cc",
    default_value = 0,
    number = 104,
  },
  Parameter {
    id = "env1_decay",
    name = "Decay",
    type = "cc",
    default_value = 32,
    number = 105,
  },
  Parameter {
    id = "env1_sustain",
    name = "Sustain",
    type = "cc",
    default_value = 0,
    number = 106,
  },
  Parameter {
    id = "env1_release",
    name = "Release",
    type = "cc",
    default_value = 20,
    number = 107,
  }
}

local group_env2 = Group {
  name = "Envelope 2",
  Parameter {
    id = "env2_attack",
    name = "Attack",
    type = "cc",
    default_value = 0,
    number = 108,
  },
  Parameter {
    id = "env2_decay",
    name = "Decay",
    type = "cc",
    default_value = 32,
    number = 109,
  },
  Parameter {
    id = "env2_sustain",
    name = "Sustain",
    type = "cc",
    default_value = 0,
    number = 110,
  },
  Parameter {
    id = "env2_release",
    name = "Release",
    type = "cc",
    default_value = 20,
    number = 111,
  }
}
local group_modulation_sources = Group {
  Parameter {
    id = "mod_1_source",
    name = "M1 Source",
    items = {"lfo 1","lfo 2","stpseq","stpsq1","stpsq2","arp","mwheel","afttch","bender","offset","cv 1","cv 2","cv 3","cv 4","cc A","cc B","cc C","cc D","noise","env 1","env 2","velo","random","note","gate","audio","op. 1","op. 2","trg 1","trg 2"},
    type = "nrpn",
    number = 32
  },
  Parameter {
    id = "mod_2_source",
    name = "M2 Source",
    items = {"lfo 1","lfo 2","stpseq","stpsq1","stpsq2","arp","mwheel","afttch","bender","offset","cv 1","cv 2","cv 3","cv 4","cc A","cc B","cc C","cc D","noise","env 1","env 2","velo","random","note","gate","audio","op. 1","op. 2","trg 1","trg 2"},
    type = "nrpn",
    number = 35
  },
  Parameter {
    id = "mod_3_source",
    name = "M3 Source",
    items = {"lfo 1","lfo 2","stpseq","stpsq1","stpsq2","arp","mwheel","afttch","bender","offset","cv 1","cv 2","cv 3","cv 4","cc A","cc B","cc C","cc D","noise","env 1","env 2","velo","random","note","gate","audio","op. 1","op. 2","trg 1","trg 2"},
    type = "nrpn",
    number = 38
  },
  Parameter {
    id = "mod_4_source",
    name = "M4 Source",
    items = {"lfo 1","lfo 2","stpseq","stpsq1","stpsq2","arp","mwheel","afttch","bender","offset","cv 1","cv 2","cv 3","cv 4","cc A","cc B","cc C","cc D","noise","env 1","env 2","velo","random","note","gate","audio","op. 1","op. 2","trg 1","trg 2"},
    type = "nrpn",
    number = 41
  },
  Parameter {
    id = "mod_5_source",
    name = "M5 Source",
    items = {"lfo 1","lfo 2","stpseq","stpsq1","stpsq2","arp","mwheel","afttch","bender","offset","cv 1","cv 2","cv 3","cv 4","cc A","cc B","cc C","cc D","noise","env 1","env 2","velo","random","note","gate","audio","op. 1","op. 2","trg 1","trg 2"},
    type = "nrpn",
    number = 44
  },
  Parameter {
    id = "mod_6_source",
    name = "M6 Source",
    items = {"lfo 1","lfo 2","stpseq","stpsq1","stpsq2","arp","mwheel","afttch","bender","offset","cv 1","cv 2","cv 3","cv 4","cc A","cc B","cc C","cc D","noise","env 1","env 2","velo","random","note","gate","audio","op. 1","op. 2","trg 1","trg 2"},
    type = "nrpn",
    number = 47
  },
  Parameter {
    id = "mod_7_source",
    name = "M7 Source",
    items = {"lfo 1","lfo 2","stpseq","stpsq1","stpsq2","arp","mwheel","afttch","bender","offset","cv 1","cv 2","cv 3","cv 4","cc A","cc B","cc C","cc D","noise","env 1","env 2","velo","random","note","gate","audio","op. 1","op. 2","trg 1","trg 2"},
    type = "nrpn",
    number = 50
  },
  Parameter {
    id = "mod_8_source",
    name = "M8 Source",
    items = {"lfo 1","lfo 2","stpseq","stpsq1","stpsq2","arp","mwheel","afttch","bender","offset","cv 1","cv 2","cv 3","cv 4","cc A","cc B","cc C","cc D","noise","env 1","env 2","velo","random","note","gate","audio","op. 1","op. 2","trg 1","trg 2"},
    type = "nrpn",
    number = 53
  },
  Parameter {
    id = "mod_9_source",
    name = "M9 Source",
    items = {"lfo 1","lfo 2","stpseq","stpsq1","stpsq2","arp","mwheel","afttch","bender","offset","cv 1","cv 2","cv 3","cv 4","cc A","cc B","cc C","cc D","noise","env 1","env 2","velo","random","note","gate","audio","op. 1","op. 2","trg 1","trg 2"},
    type = "nrpn",
    default_value = 21,
    number = 56
  },
  Parameter {
    id = "mod_10_source",
    name = "M10 Source",
    items = {"lfo 1","lfo 2","stpseq","stpsq1","stpsq2","arp","mwheel","afttch","bender","offset","cv 1","cv 2","cv 3","cv 4","cc A","cc B","cc C","cc D","noise","env 1","env 2","velo","random","note","gate","audio","op. 1","op. 2","trg 1","trg 2"},
    type = "nrpn",
    number = 59
  },
  Parameter {
    id = "mod_11_source",
    name = "M11 Source",
    items = {"lfo 1","lfo 2","stpseq","stpsq1","stpsq2","arp","mwheel","afttch","bender","offset","cv 1","cv 2","cv 3","cv 4","cc A","cc B","cc C","cc D","noise","env 1","env 2","velo","random","note","gate","audio","op. 1","op. 2","trg 1","trg 2"},
    type = "nrpn",
    number = 62
  },
  Parameter {
    id = "mod_12_source",
    name = "M12 Source",
    items = {"lfo 1","lfo 2","stpseq","stpsq1","stpsq2","arp","mwheel","afttch","bender","offset","cv 1","cv 2","cv 3","cv 4","cc A","cc B","cc C","cc D","noise","env 1","env 2","velo","random","note","gate","audio","op. 1","op. 2","trg 1","trg 2"},
    type = "nrpn",
    number = 65
  }

}

local group_modulation_dest = Group {
  Parameter {
    id = "mod_1_dest",
    name = "M1 Destination",
    items = {"cutoff","vca","pwm 1","pwm 2","osc 1","osc 2","osc 1 + 2","fine","mix","noise","subosc","reso","cv 1","cv 2","attack","lfo 1","lfo 2","env 1","env 2"},
    type = "nrpn",
    number = 33
  },
    Parameter {
    id = "mod_2_dest",
    name = "M2 Destination",
    items = {"cutoff","vca","pwm 1","pwm 2","osc 1","osc 2","osc 1 + 2","fine","mix","noise","subosc","reso","cv 1","cv 2","attack","lfo 1","lfo 2","env 1","env 2"},
    type = "nrpn",
    number = 36
  },
    Parameter {
    id = "mod_3_dest",
    name = "M3 Destination",
    items = {"cutoff","vca","pwm 1","pwm 2","osc 1","osc 2","osc 1 + 2","fine","mix","noise","subosc","reso","cv 1","cv 2","attack","lfo 1","lfo 2","env 1","env 2"},
    type = "nrpn",
    number = 39
  },
    Parameter {
    id = "mod_4_dest",
    name = "M4 Destination",
    items = {"cutoff","vca","pwm 1","pwm 2","osc 1","osc 2","osc 1 + 2","fine","mix","noise","subosc","reso","cv 1","cv 2","attack","lfo 1","lfo 2","env 1","env 2"},
    type = "nrpn",
    number = 42
  },
    Parameter {
    id = "mod_5_dest",
    name = "M5 Destination",
    items = {"cutoff","vca","pwm 1","pwm 2","osc 1","osc 2","osc 1 + 2","fine","mix","noise","subosc","reso","cv 1","cv 2","attack","lfo 1","lfo 2","env 1","env 2"},
    type = "nrpn",
    number = 45
  },
    Parameter {
    id = "mod_6_dest",
    name = "M6 Destination",
    items = {"cutoff","vca","pwm 1","pwm 2","osc 1","osc 2","osc 1 + 2","fine","mix","noise","subosc","reso","cv 1","cv 2","attack","lfo 1","lfo 2","env 1","env 2"},
    type = "nrpn",
    number = 48
  },
    Parameter {
    id = "mod_7_dest",
    name = "M7 Destination",
    items = {"cutoff","vca","pwm 1","pwm 2","osc 1","osc 2","osc 1 + 2","fine","mix","noise","subosc","reso","cv 1","cv 2","attack","lfo 1","lfo 2","env 1","env 2"},
    type = "nrpn",
    number = 51
  },
    Parameter {
    id = "mod_8_dest",
    name = "M8 Destination",
    items = {"cutoff","vca","pwm 1","pwm 2","osc 1","osc 2","osc 1 + 2","fine","mix","noise","subosc","reso","cv 1","cv 2","attack","lfo 1","lfo 2","env 1","env 2"},
    type = "nrpn",
    number = 54
  },
    Parameter {
    id = "mod_9_dest",
    name = "M9 Destination",
    items = {"cutoff","vca","pwm 1","pwm 2","osc 1","osc 2","osc 1 + 2","fine","mix","noise","subosc","reso","cv 1","cv 2","attack","lfo 1","lfo 2","env 1","env 2"},
    type = "nrpn",
    default_value = 2,
    number = 57
  },
    Parameter {
    id = "mod_10_dest",
    name = "M10 Destination",
    items = {"cutoff","vca","pwm 1","pwm 2","osc 1","osc 2","osc 1 + 2","fine","mix","noise","subosc","reso","cv 1","cv 2","attack","lfo 1","lfo 2","env 1","env 2"},
    type = "nrpn",
    number = 60
  },
    Parameter {
    id = "mod_11_dest",
    name = "M11 Destination",
    items = {"cutoff","vca","pwm 1","pwm 2","osc 1","osc 2","osc 1 + 2","fine","mix","noise","subosc","reso","cv 1","cv 2","attack","lfo 1","lfo 2","env 1","env 2"},
    type = "nrpn",
    number = 63
  },
    Parameter {
    id = "mod_12_dest",
    name = "M12 Destination",
    items = {"cutoff","vca","pwm 1","pwm 2","osc 1","osc 2","osc 1 + 2","fine","mix","noise","subosc","reso","cv 1","cv 2","attack","lfo 1","lfo 2","env 1","env 2"},
    type = "nrpn",
    number = 66
  }
}

local group_modulations_amount = Group {
  Parameter {
    id = "mod_1_amount",
    name = "M1 Amount",
    type = "nrpn",
    min_value = 193,
    max_value = 319,
    default_value = 256,
    display_min_value = -63,
    display_max_value = 63,
    number = 34
  },
  Parameter {
    id = "mod_2_amount",
    name = "M2 Amount",
    type = "nrpn",
    min_value = 193,
    max_value = 319,
    default_value = 256,
    display_min_value = -63,
    display_max_value = 63,
    number = 37
  },
  Parameter {
    id = "mod_3_amount",
    name = "M3 Amount",
    type = "nrpn",
    min_value = 193,
    max_value = 319,
    default_value = 256,
    display_min_value = -63,
    display_max_value = 63,
    number = 40
  },
  Parameter {
    id = "mod_4_amount",
    name = "M4 Amount",
    type = "nrpn",
    min_value = 193,
    max_value = 319,
    default_value = 256,
    display_min_value = -63,
    display_max_value = 63,
    number = 43
  },
  Parameter {
    id = "mod_5_amount",
    name = "M5 Amount",
    type = "nrpn",
    min_value = 193,
    max_value = 319,
    default_value = 256,
    display_min_value = -63,
    display_max_value = 63,
    number = 46
  },
  Parameter {
    id = "mod_6_amount",
    name = "M6 Amount",
    type = "nrpn",
    min_value = 193,
    max_value = 319,
    default_value = 256,
    display_min_value = -63,
    display_max_value = 63,
    number = 49
  },
  Parameter {
    id = "mod_7_amount",
    name = "M7 Amount",
    type = "nrpn",
    min_value = 193,
    max_value = 319,
    default_value = 256,
    display_min_value = -63,
    display_max_value = 63,
    number = 52
  },
  Parameter {
    id = "mod_8_amount",
    name = "M8 Amount",
    type = "nrpn",
    min_value = 193,
    max_value = 319,
    default_value = 256,
    display_min_value = -63,
    display_max_value = 63,
    number = 55
  },
  Parameter {
    id = "mod_9_amount",
    name = "M9 Amount",
    type = "nrpn",
    min_value = 193,
    max_value = 319,
    default_value = 319,
    display_min_value = -63,
    display_max_value = 63,
    number = 58
  },
  Parameter {
    id = "mod_10_amount",
    name = "M10 Amount",
    type = "nrpn",
    min_value = 193,
    max_value = 319,
    default_value = 256,
    display_min_value = -63,
    display_max_value = 63,
    number = 61
  },
  Parameter {
    id = "mod_11_amount",
    name = "M11 Amount",
    type = "nrpn",
    min_value = 193,
    max_value = 319,
    default_value = 256,
    display_min_value = -63,
    display_max_value = 63,
    number = 64
  },
  Parameter {
    id = "mod_12_amount",
    name = "M12 Amount",
    type = "nrpn",
    min_value = 193,
    max_value = 319,
    default_value = 256,
    display_min_value = -63,
    display_max_value = 63,
    number = 67
  }
}

return SynthDefinition {
  id = "mutable_instruments_shruthi1",
  name = "Mutable Instruments Shruthi-1",
  author = "gelabs",
  beta = true,
  content_height = 410,
  Section {
    name = "Synthesis",
    group_osc1,
    group_osc2,
    group_mixer,
    group_filter,
    group_lfo1,
    group_lfo2,
    group_env1,
    group_env2
  },
  Section {
    name = "Modulation matrix",
    group_modulation_sources,
    group_modulation_dest,
    group_modulations_amount
  }
}
