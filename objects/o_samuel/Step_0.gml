var _song = asset_get_index("fan_sam"+string(song))

if touched
	{
		timer++
		
		if timer = 50
			{
				image_speed = 1.6
				Sound(_song)
			}
			
		if timer > 60 && !audio_is_playing(_song)
			{
				image_speed = 0
				image_index = 0
				SetGameFlag(eFlag.playerCanMove,1)
				audio_sound_gain(global.music,global.musicMasterVolume,500)
			}
	}
