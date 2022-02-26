if(!audiogroupsLoaded) {
	if(audio_group_is_loaded(agrp_sounds)) {
		audiogroupsLoaded = true;
		room_goto(r_title);
	}
}

if !window_has_focus() then audio_master_gain(0) else if window_has_focus() then audio_master_gain(1)

// if keyboard_check_pressed(vk_escape) then game_end() //FUCK YOU GO FUCVK YOURSELF YOU FUCKING BITCH

//Fade handling n shit
if(GetGameFlag(eFlag.doFadeIn)) {
	fadeValue = min(fadeValue + fadeSpeed, 1);
} else {
	fadeValue = max(fadeValue - fadeSpeed, 0);
}

//base stop fucking using brackets like this

// fuck you your mother is upon my penis and i am currently having sex with her vagina


animate += 0.2
if animate >= 2 then animate = 0

#region Music Junk

if(global.musicTarget != global.musicPlaying) { //if music has changed
	if(global.musicPlaying == sx_nothing) { //if there was no music being played, no need to wait for fading
		audio_sound_gain(global.music,0,0);
	} else {
		audio_sound_gain(global.music,0,100);
	}
	if(audio_sound_get_gain(global.music) == 0) { //when the old song finishes fading out
		audio_stop_sound(global.music); //stop the old song
		global.musicPlaying = global.musicTarget; //set the song to play
		global.music = audio_play_sound_on(global.musicEmitter, global.musicPlaying, global.musicLoops, 0); //play the song
		//audio_sound_gain(global.music,0,0); //set song volume to zero wait why is this needed???
		audio_sound_gain(global.music,1,0); //set its volume
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