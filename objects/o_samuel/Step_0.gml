if audio_sound_get_gain(global.music) = 0 && !GetGameFlag(eFlag.playerCanMove) && !played
	{
		timer++
		image_speed = 1.2
	}

if played && !audio_is_playing(asset_get_index("fan_sam"+string(song))) && timer > 151 && !lazyfix
	{
		SetGameFlag(eFlag.playerCanMove,1)
		image_speed = 0
		image_index = 0
		lazyfix = 1
	}

if timer > 0 then timer++
if timer = 150
	{
		Sound(asset_get_index("fan_sam"+string(song)))
		played = true
	}
