if !window_has_focus() then audio_master_gain(0) else if window_has_focus() then audio_master_gain(1)

if keyboard_check_pressed(vk_escape) then game_end()

if room = r_init && keyboard_check_pressed(vk_space)
	{
		room_goto(global.vars.roomgo)
		//Sound(sx_shop_move,0)
	}

//base stop fucking using brackets like this

// fuck you your mother is upon my penis and i am currently having sex with her vagina
if !instance_exists(o_pause)
	{
		if keyboard_check_pressed(vk_enter) && global.player.move && instance_exists(o_player)
			{
				instance_create_depth(0,0,0,o_pause)
				//show_message("create")
			}
	}

animate += 0.2
if animate >= 2 then animate = 0

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
					audio_sound_gain(global.vars.playing,global.setting.music/100,0)
				}
		}

#endregion

#region title scroll
if titleloop
	{
		if titlecount = ds_list_size(anim_title_table)-1 then titlecount = 0
		titlecount += 0.1
		window_set_caption(ds_list_find_value(anim_title_table,floor(titlecount)))
	}
#endregion

//show_debug_message(global.setting.music)