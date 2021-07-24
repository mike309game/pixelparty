function Sound(sound,loop)
	{
		if !is_undefined(sound)
			{
				audio_play_sound(asset_get_index(sound),0,loop)
				audio_sound_gain(asset_get_index(sound),global.setting.sound/100,0)
			} else {
				show_debug_message("sound is undefined")
			}
	}

function Music(play,loop)
	{
		
		if !is_undefined(play) then global.vars.play = asset_get_index(play)
		if !is_undefined(loop) then global.vars.loopplay = loop
	}
	
function roomTrans(roo,posid,fade)
	{
		global.vars.roomgo = roo
		global.vars.roompt = posid
		if !is_undefined(fade) then global.vars.roomtr = fade
	}