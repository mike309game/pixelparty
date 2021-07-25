if keyboard_check_pressed(vk_escape) then game_end()

if room = r_init then room_goto(r_yisify)

if !instance_exists(o_console)
	{
		if keyboard_check_pressed(vk_alt) && global.debug.debug_enabled
			{
				instance_create_depth(0,0,0,o_console)
				//show_message("create")
			}
	}
	
if !instance_exists(o_pause)
	{
		if keyboard_check_pressed(vk_enter) && global.player.move && instance_exists(o_player)
			{
				instance_create_depth(0,0,0,o_pause)
				//show_message("create")
			}
	}


if !view_enabled
	{
		view_camera[0] = camera_create_view(0, 0, 320, 240, 0, -1, 0, 0, 0, 0)
		view_enabled = true
		view_visible[0] = true
		camera_apply(0)
	}

#region Music Junk

	if global.vars.play != global.vars.playing
		{
			if global.vars.playing != sx_nothing then audio_sound_gain(global.vars.playing,0,100) else audio_sound_gain(global.vars.playing,0,0)
			if audio_sound_get_gain(global.vars.playing) = 0
				{
					audio_stop_sound(global.vars.playing)
					global.vars.playing = global.vars.play
					audio_play_sound(global.vars.playing,0,global.vars.loopplay)
					audio_sound_gain(global.vars.playing,0,0)
					audio_sound_gain(global.vars.playing,1,100)
				}
		}

#endregion

