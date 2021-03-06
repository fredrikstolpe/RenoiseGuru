return SynthDefinition{
  id = "electrix_mofx",
  name = "Electrix MOFX",
  author = "MIDI/Error!! [errormidi@gmail.com]",
  beta = true,
  Section {
    Group {
    name = "Distortion",
              Parameter {
      id = "dengage",
    name = "Engage",
    type = "cc",
    number = 25,
    default_value = 1,
   item_values = {60, 80},  
   items = {"Off","On"},
    },
      Parameter {
    id = "d_level",
    name = "Level",
    type = "cc",
    number = 26,
    default_value = 0,
   max_value = 127,
   min_value = 0,
   },
      Parameter {
    id = "d_drive",
    name = "Drive",
    type = "cc",
    number = 27,
    default_value = 0,
   max_value = 127,
   min_value = 0,
      },
   Parameter {
      id = "dtofx",
    name = "Dist to FX",
    type = "cc",
    number = 24,
    default_value = 1,
   item_values = {60, 80},  
   items = {"Off","On"},
           },
          },
    Group {
    name = "Flange",
    Parameter {
      id = "fengage",
    name = "Engage",
    type = "cc",
    number = 29,
    default_value = 1,
   item_values = {60, 80},  
   items = {"Off","On"},
         },
      Parameter {
    id = "f_mix",
    name = "Mix",
    type = "cc",
    number = 30,
    default_value = 0,
   max_value = 127,
   min_value = 0,
   },
      Parameter {
    id = "f_depth",
    name = "Depth",
    type = "pitchbend",
    default_value = 8200,
    display_min_value = -64,
    display_max_value = 63
      },           
      Parameter {
    id = "f_speed",
    name = "Speed",
    type = "cc",
    number = 32,
    default_value = 0,
   max_value = 127,
   min_value = 0,
   },
         Parameter {
    id = "f_regen",
    name = "Regen",
    type = "cc",
    number = 33,
    default_value = 0,
   max_value = 127,
   min_value = 0,
   },
   Parameter {
      id = "f_sync",
    name = "Sync",
    type = "cc",
    number = 35,
    default_value = 1,
   item_values = {60, 80},  
   items = {"Off","On"},
     },
   Parameter {
      id = "f_band",
    name = "Band",
    type = "cc",
    number = 34,
    default_value = 1,
   item_values = {0, 1, 2, 3, 4, 5, 6},  
   items = {"All","Hi","Mid","Low","H/Lo","M/Lo","M/Hi"},
              },
          },
    Group {
    name = "Tremelo",
    Parameter {
      id = "tengage",
    name = "Engage",
    type = "cc",
    number = 37,
    default_value = 1,
   item_values = {60, 80},  
   items = {"Off","On"},
         },
      Parameter {
    id = "t_mix",
    name = "Mix",
    type = "cc",
    number = 38,
    default_value = 0,
   max_value = 127,
   min_value = 0,
   },
      Parameter {
    id = "t_wave",
    name = "Waveform",
    type = "cc",
    number = 39,
    default_value = 1,
  item_values = {0, 20, 47, 61, 84, 104, 127},  
   items = {"Sine","Saw","uRa","dRa","wSq","hSq","qSq"},
      },           
      Parameter {
    id = "t_speed",
    name = "Speed",
    type = "cc",
    number = 40,
    default_value = 0,
   max_value = 127,
   min_value = 0,
   },
   Parameter {
      id = "t_sync",
    name = "Sync",
    type = "cc",
    number = 43,
    default_value = 1,
   item_values = {60, 80},  
   items = {"Off","On"},
     },
        Parameter {
      id = "t_autopan",
    name = "Autopan",
    type = "cc",
    number = 41,
    default_value = 1,
   item_values = {60, 80},  
   items = {"Off","On"},
     },
   Parameter {
      id = "t_band",
    name = "Band",
    type = "cc",
    number = 42,
    default_value = 1,
   item_values = {0, 1, 2, 3, 4, 5, 6},  
   items = {"All","Hi","Mid","Low","H/Lo","M/Lo","M/Hi"},
              },
          },
    Group {
    name = "Delay",
    Parameter {
      id = "deengage",
    name = "Engage",
    type = "cc",
    number = 45,
    default_value = 1,
   item_values = {60, 80},  
   items = {"Off","On"},
         },
      Parameter {
    id = "de_mix",
    name = "Mix",
    type = "cc",
    number = 46,
    default_value = 0,
   max_value = 127,
   min_value = 0,
   },
      Parameter {
    id = "de_feed",
    name = "Feedback",
    type = "cc",
    number = 47,
    default_value = 0,
   max_value = 127,
   min_value = 0,
      },           
      Parameter {
    id = "de_time",
    name = "Time",
    type = "cc",
    number = 48,
    default_value = 0,
   max_value = 127,
   min_value = 0,
   },
   Parameter {
      id = "de_sync",
    name = "Sync",
    type = "cc",
    number = 51,
    default_value = 1,
   item_values = {60, 80},  
   items = {"Off","On"},
     },
        Parameter {
      id = "de_pingpong",
    name = "Ping-Pong",
    type = "cc",
    number = 49,
    default_value = 1,
   item_values = {60, 80},  
   items = {"Off","On"},
     },
   Parameter {
      id = "de_band",
    name = "Band",
    type = "cc",
    number = 50,
    default_value = 1,
   item_values = {0, 1, 2, 3, 4, 5, 6},  
   items = {"All","Hi","Mid","Low","H/Lo","M/Lo","M/Hi"},
       },
          },
    Group {
    name = "Global",
    Parameter {
      id = "bypass",
    name = "Bypass",
    type = "cc",
    number = 54,
    default_value = 1,
   item_values = {60, 80},  
   items = {"Off","On"},
          },
       Parameter {
      id = "ttmode",
    name = "TapTempo Mode",
    type = "cc",
    number = 52,
    default_value = 1,
   item_values = {0, 1, 2},  
   items = {"Tap","Clock", "Auto"},
             },
       Parameter {
      id = "dry",
    name = "Dry",
    type = "cc",
    number = 53,
    default_value = 1,
   item_values = {0, 1, 2},  
   items = {"Thru","Kill", "Auto"},
                },
          Parameter {
      id = "tap",
    name = "Tap Tempo",
    type = "cc",
    number = 67,
    items = {"Tap"},
    item_values = {127}
           }
          }
        }
      }
