switch event 
	{
		case "sound":
			{
				audio_play_sound(data[0],0,0)
				break;
			}
		case "pspawn":
			{
				puzzleAdd(data[0],data[1],data[2])
				break;
			}
		case "event":
			{
				ds_map_set(global.gameevent,data[0],1)
				break;
			}
	}
instance_destroy(self)