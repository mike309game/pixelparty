/// @func Typewritter(skippable)
/// @desc Creates typewritter struct
/// @arg [skippable]

function Typewritter(_skippable = 1) constructor {
	text = "";
	textLen = 0;
	textPointer = 0;
	
	letterList = ds_list_create();
	letterListLen = 0;
	canAdvance = 1;
	advanceCountdown = -1;
	skippable = _skippable;
	
	static Step = function() { //returns wether it's awaiting input
		gml_pragma("forceinline");
		var skipText = 0;
		if(--advanceCountdown == 0) {
			canAdvance = 1;
		}
		if(textPointer >= textLen) {
			canAdvance = 0;
			return 1;
		}
		if(keycheck_pressed(eChar.x) && skippable) {
			skipText = 1;
			canAdvance = 1; //force advancing because advancing only happens when the timer is done
		}
		while(canAdvance && textPointer < textLen) {
			textPointer = AdvanceLetterList(letterList, text, textPointer);
			letterListLen++;
			
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
		ClearLetterList(letterList);
		ds_list_destroy(letterList);
	}
}