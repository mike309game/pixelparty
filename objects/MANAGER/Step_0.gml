if !window_has_focus() then audio_master_gain(0) else if window_has_focus() then audio_master_gain(1)

// if keyboard_check_pressed(vk_escape) then game_end() //FUCK YOU GO FUCVK YOURSELF YOU FUCKING BITCH

//Fade handling n shit
if(GetGameFlag(eFlag.doFadeIn)) {
	fadeValue = min(fadeValue + fadeSpeed, 1);
} else {
	fadeValue = max(fadeValue - fadeSpeed, 0);
}

if room = r_init //&& keyboard_check_pressed(vk_space)
	{
		room_goto(r_l1_r1);
		//Sound(sx_shop_move)
	}

//base stop fucking using brackets like this

// fuck you your mother is upon my penis and i am currently having sex with her vagina
if !instance_exists(o_pause)
	{
		if keyboard_check_pressed(vk_enter) && global.player.move //&& instance_exists(o_player)
			{
				instance_create_depth(0,0,-16000,o_pause)
				//show_message("create")
			}
	}

animate += 0.2
if animate >= 2 then animate = 0

#region Music Junk

if(global.musicTarget != global.musicPlaying) { //if music has changed
	if(global.musicPlaying == sx_nothing) { //if there was no music being played, no need to wait for fading
		audio_sound_gain(global.musicPlaying,0,0);
	} else {
		audio_sound_gain(global.musicPlaying,0,100);
	}
	if(audio_sound_get_gain(global.musicPlaying) == 0) { //when the old song finishes fading out
		audio_stop_sound(global.musicPlaying); //stop the old song
		global.musicPlaying = global.musicTarget; //set the song to play
		audio_play_sound(global.musicPlaying,0,global.musicLoops); //play the song
		audio_sound_gain(global.musicPlaying,0,0); //set song volume to zero wait why is this needed???
		audio_sound_gain(global.musicPlaying,global.setting.music/100,0); //set its volume
	}
}

#endregion

#region title scroll
if(animatedTitle) {
	animatedTitleCounter += 0.1;
	var title = ds_list_find_value(anim_title_table,floor(titlesCount));
	if(title == undefined) { //done showing animated title
		animatedTitle = false;
		window_set_caption(titles[irandom_range(0,titlesCount-1)]); //get a random normal title
	} else {
		window_set_caption(title);
	}
}
#endregion

//show_debug_message(global.setting.music)