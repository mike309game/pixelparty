/// @func Typewritter(skippable)
/// @desc Creates typewritter struct
/// @arg [skippable]

function Typewritter(_skippable = 1) constructor {
	letterList = ds_list_create();
	letterListLength = 0;
	characterCount = -1;
	canAdvance = 1;
	advanceCountdown = -1;
	skippable = _skippable;
	
	static Step = function() { //returns wether it's awaiting input
		gml_pragma("forceinline");
		var skipText = 0;
		if(--advanceCountdown == 0) {
			canAdvance = 1;
		}
		if(characterCount >= letterListLength) {
			canAdvance = 0;
			return 1;
		}
		if(keycheck_pressed(eLetter.x) && skippable) {
			skipText = 1;
			canAdvance = 1; //force advancing because advancing only happens when the timer is done
		}
		while(canAdvance && characterCount < letterListLength) {
		//for(;characterCount < letterListLength && canAdvance; characterCount++) {
			
			while(letterList[|characterCount++] == 12121212) {
				characterCount += 3;
			}
			//show_debug_message("step: ord=" + string(letterList[|characterCount]) + " chr=" + chr(letterList[|characterCount]));
			
			var textDelay = skipText ? 0 : global.script_variables[? "text delay"];
			if(textDelay != 0) {
				advanceCountdown = textDelay;
				canAdvance = 0;
				audio_play_sound(sx_text_sound,0,0);
				break;
			}
		}
		return 0;
	}
	static Cleanup = function() {
		gml_pragma("forceinline");
		ds_list_destroy(letterList);
	}
}