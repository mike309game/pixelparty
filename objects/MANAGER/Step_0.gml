if(DEBUGMODE && GetGameFlag(eFlag.showPerfMeter)) {
	show_debug_overlay(GetGameFlag(eFlag.showPerfMeter));
}

if(!audiogroupsLoaded) {
	if(audio_group_is_loaded(agrp_sounds)) {
		audiogroupsLoaded = true;
		room_goto(START_ROOM);
		switch(START_ROOM) {
			case r_intro:
			case r_titlecards:
			case r_title:
			case r_l1_shop:
				NegateGameFlag(eFlag.playerCanMove | eFlag.playerCanTransition);
				break;
		}
	}
}

audio_master_gain(window_has_focus()); //if unfocused mute audio

//Fade handling n shit
if(GetGameFlag(eFlag.doFadeIn)) {
	fadeValue = min(fadeValue + fadeSpeed, 1);
} else {
	fadeValue = max(fadeValue - fadeSpeed, 0);
}

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