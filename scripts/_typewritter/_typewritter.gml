/// @func Typewritter(skippable)
/// @desc Creates typewritter struct
/// @arg [skippable]

function Typewritter(_skippable = true) constructor {
	text = "";
	textLen = 0;
	textPointer = 0;
	
	letterList = ds_list_create();
	letterListLen = 0;
	canAdvance = true;
	advanceCountdown = -1;
	skippable = _skippable;
	
	static Step = function() { //returns wether it's awaiting input
		gml_pragma("forceinline");
		var skipText = false;
		if(--advanceCountdown == 0) {
			canAdvance = true;
		}
		if(textPointer >= textLen) {
			canAdvance = false;
			return 1;
		}
		if(keycheck_pressed(vk_shift) && skippable) {
			skipText = true;
			canAdvance = true; //force advancing because advancing only happens when the timer is done
		}
		while(canAdvance && textPointer < textLen) {
			textPointer = AdvanceLetterList();
			letterListLen++;
			
			var textDelay = skipText ? 0 : global.script_variables[? "text delay"];
			if(textDelay != 0) {
				advanceCountdown = textDelay;
				canAdvance = false;
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
	
	//not static to not affect other typewritters
	//i dont know how i didn't think of that at first
	//i'm not fucking using structs go away
	advancer_flags = int64(0);
	advancer_rShakeAmp = 0;
	advancer_vShakeAmp = 0;
	advancer_vShakeFreq = 0;
	advancer_hShakeAmp = 0;
	advancer_hShakeFreq = 0;
	
	static AdvanceLetterList = function() {
		gml_pragma("forceinline");
		var stringPointer = textPointer;
		
		var colour = 0;
		var alpha = 1;
		var newlines = 0;
		
		/*static flags = int64(0);
		static rShakeAmp = 0;
		static vShakeAmp = 0;
		static vShakeFreq = 0;
		static hShakeAmp = 0;
		static hShakeFreq = 0;*/
		
		var char = string_ord_at(text, ++stringPointer);
		
		while(char == eChar.backslash) { //advance string pointer, check for command begin
			stringPointer = string_read_terminated(text, ++stringPointer, ["["], 0);
			var cmdName = global.stringReadReturn;
			
			//var isValue = string_ord_at(string, stringPointer) == eChar.dollar;
			
			var args = [];
			var argIndex = 0;
			
			while(string_ord_at(text, ++stringPointer) != eChar.squareBracketR) {
				while(string_ord_at(text, stringPointer) == $20){stringPointer++;} //allow for spaces in between args in the right side
				var argType = string_ord_at(text, stringPointer);
				stringPointer = string_read_terminated(text, ++stringPointer, [",", "]"], 0);
				switch(argType) {
					case eChar.hash:
						args[argIndex++] = real(global.stringReadReturn);
						break;
					case eChar.dollar:
						args[argIndex++] = global.script_variables[?global.stringReadReturn];
						break;
					case eChar.at:
						args[argIndex++] = global.stringReadReturn;
						break;
					default:
						show_error("FUCK", 1);
						break;
				}
				if(string_ord_at(text, stringPointer) == eChar.squareBracketR) {
					//stringPointer--; //hacky as fuck but i want to get this done with by 19:00
					break;
				}
			}
			
			switch(cmdName) {
				case "ereset":
					advancer_flags = int64(0);
					advancer_rShakeAmp = 0;
					advancer_vShakeAmp = 0;
					advancer_vShakeFreq = 0;
					advancer_hShakeAmp = 0;
					advancer_hShakeFreq = 0;
					break;
				case "colour":
					advancer_flags |= eTextFlag.colourChanging;
					colour = real(args[0]);
					alpha = real(args[1]);
					break;
				case "rainbw":
					advancer_flags ^= eTextFlag.rainbow;
					break;
				case "rshake":
					advancer_flags ^= eTextFlag.randomShake;
					advancer_rShakeAmp = real(args[0]);
					break;
				case "hshake":
					advancer_flags ^= eTextFlag.horzShake;
					break;
				case "hshamp":
					advancer_hShakeAmp = real(args[0]);
					break;
				case "hshfrq":
					advancer_hShakeFreq = real(args[0]);
					break;
				default:
					show_error("bummer", 1);
					break;
			}
			char = string_ord_at(text, ++stringPointer);
		}
		while(char == eChar.newline) {
			newlines++;
			char = string_ord_at(text, ++stringPointer);
		}
		ds_list_add(letterList, new Letter(
			chr(char)/*string_char_at(text, stringPointer)*/,
			advancer_flags, newlines, (stringPointer - textPointer),
			colour, alpha, advancer_rShakeAmp, advancer_vShakeAmp, advancer_vShakeFreq, advancer_hShakeAmp, advancer_hShakeFreq
		));
		advancer_flags &= ~(eTextFlag.colourChanging | eTextFlag.newLine); //this isn't toggleable so it has to be reset
		return stringPointer;
	}
	
	static RegressLetterList = function() {
		gml_pragma("forceinline");
		var item = ds_list_size(letterList)-1;
		var ptrDecreased = textPointer - letterList[|item].textPointerDifference;
		delete letterList[|item];
		ds_list_delete(letterList, item);
		return ptrDecreased;
	}
	
	static ClearLetterList = function() {
		gml_pragma("forceinline");
		var listLen = ds_list_size(letterList);
		for(var i = 0; i < listLen; i++) {
			delete letterList[|i];
		}
		ds_list_clear(letterList);
	}
}