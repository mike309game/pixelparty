function Sound(sound, pitch = 1, volume = 1, loops = false)
	{
		//what in the fuck
		/*if !is_undefined(sound)
			{
				audio_play_sound(asset_get_index(sound),0,loop)
				audio_sound_gain(asset_get_index(sound),global.setting.sound/100,0)
			} else {
				show_debug_message("oopsie poopsie sound is not real :)")
			}*/
		var theSound = audio_play_sound_on(global.soundEmitter, sound, loops, 0);
		audio_sound_gain(theSound,volume,0);
		audio_sound_pitch(theSound, pitch);
		return theSound;
	}

function Music(song, loop = true) {
	/*if !is_undefined(play) then global.vars.play = asset_get_index(play) else show_debug_message("MUSIC UNDEFINED OR DOESNT EXIST")
	if !is_undefined(loop) then global.vars.loopplay = loop else show_debug_message("loop not defined")*/
	
	global.musicTarget = song;
	global.musicLoops = loop;
}