switch event 
	{
		case "sound":
			{
				audio_play_sound(data[0],0,0)
				instance_destroy(self)
				break;
			}
		case "pspawn":
			{
				puzzleAdd(data[0],data[1],data[2])
				instance_destroy(self)
				break;
			}
		case "event":
			{
				ds_map_set(global.gameevent,data[0],1)
				instance_destroy(self)
				break;
			}
		case "honload":
			{
				instance_create_depth(0,0,0,o_honload)
				instance_destroy(self)
				break;
			}
		case "err":
			{
				show_debug_message("EVENT OBJECT ERROR // CHECK O_TEXT FOR DATA CASE")
				instance_destroy(self)
				break;
			}
	}
