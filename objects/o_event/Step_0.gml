function destroy()
	{
		instance_destroy(self)
	}

switch event 
	{
		case "sound":
			{
				audio_play_sound(data[0],0,0)
				destroy()
				break;
			}
	}