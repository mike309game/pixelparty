function Sound(sound,loop)
	{
		if !is_undefined(sound)
			{
				audio_play_sound(asset_get_index(sound),0,loop)
				audio_sound_gain(asset_get_index(sound),global.setting.sound/100,0)
			} else {
				show_debug_message("oopsie poopsie sound is not real :)")
			}
	}

function Music(play,loop)
	{
		
		if !is_undefined(play) then global.vars.play = asset_get_index(play) else show_debug_message("MUSIC UNDEFINED OR DOESNT EXIST")
		if !is_undefined(loop) then global.vars.loopplay = loop else show_debug_message("loop not defined")
		
	}
	
function roomTrans(roo,posid,fade)
	{
		global.vars.roomgo = roo
		global.vars.roompt = posid
		if !is_undefined(fade) then global.vars.roomtr = fade
	}

function invCheck(item)
	{
		for(var i = 0; i < array_length(global.playerinv); i++)
			{
				if global.playerinv[i] = item
					{
						return 1;
					}
			}
	}
function invAdd(item)
	{
				for(var i = 0; i < array_length(global.playerinv); i++)
					{
						if global.playerinv[i] = ""
							{
								//show_debug_message("found at "+string(i))
								global.playerinv[i] = string(item)
								return 1;
								break;
							}
						else if global.playerinv[i] != "" && i = 5
							{
								show_debug_message("Inventory Full")
								return 0;
							}
					}
	}
function invRemove(item)
	{
		for(var i = 0; i < array_length(global.playerinv); i++)
			{
				if global.playerinv[i] = item
					{
						global.playerinv[i] = ""
						return 1;
					}
				if i = array_length(global.playerinv) && global.playerinv[i] != item
					{
						return 0;
					}
			}
	}

function puzzleAdd(_pid,_x,_y)
	{
		var obj = instance_create_depth(_x,_y,0,o_piece)
		with(obj)
			{
				pid = _pid
				cut = 1
			}
	}