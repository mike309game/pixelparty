function Letter(
	//common
	_char, _flags, _newlines, _txptrdiff, _colour = 0, _alpha = 1,
	//random shake
	_rshake_amp = 0,
	//vertical shake
	_vshake_amp = 0, _vshake_freq = 0,
	//horizontal shake
	_hshake_amp = 0, _hshake_freq = 0
) constructor {
	x = 0; //x offset (for shake)
	y = 0; //y offset (for shake)
	newlines = _newlines;
	char = _char;
	draw_set_font(f_jaxfont);
	sep = string_width(char);
	//offset = global.JaxLarge_offsets[?char] ?? 0;
	textPointerDifference = _txptrdiff;
	flags = _flags;
	if(flags & eTextFlag.colourChanging) {
		colour = _colour;
		alpha = _alpha;
	}
	if(flags & eTextFlag.horzShake) {
		hShakeAmp = _hshake_amp;
		hShakeFreq = _hshake_freq;
	}
	if(flags & eTextFlag.vertShake) {
		vShakeAmp = _vshake_amp;
		vShakeFreq = _vshake_freq;
	}
	if(flags & eTextFlag.randomShake) {
		rShakeAmp = _rshake_amp;
	}
	static Update = function(iterator) {
		if(flags & eTextFlag.randomShake) {
			x = irandom_range(-rShakeAmp, rShakeAmp);
			y = irandom_range(-rShakeAmp, rShakeAmp);
		} else if(flags & eTextFlag.horzShake) {
			x = cos((current_time / 250 + iterator/2)) * 2;
		}
	}
}

/// @func Typewriter(skippable)
/// @desc Creates typewriter struct
/// @arg [skippable]

function Typewriter(_skippable = true, _initTextSpeed = global.script_variables[? "textDelay"]) constructor {
	text = "";
	textLen = 0;
	textPointer = 0;
	
	letterList = ds_list_create();
	letterListLen = 0;
	canAdvance = true;
	advanceCountdown = -1;
	
	skippable = _skippable;
	initTextSpeed = _initTextSpeed; //initial text speed
	textSpeed = initTextSpeed;
	
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
		if(GetInputPressed(eInput.skipText) && skippable) {
			skipText = true;
			canAdvance = true; //force advancing because advancing only happens when the timer is done
		}
		while(canAdvance && textPointer < textLen) {
			textPointer = AdvanceLetterList();
			letterListLen++;
			
			var textDelay = skipText ? 0 : textSpeed;
			if(textDelay != 0) {
				advanceCountdown = textDelay;
				canAdvance = false;
				if !audio_is_playing(sx_text_sound)
					{
						Sound(sx_text_sound);
						audio_sound_pitch(sx_text_sound,random_range(0.9,1.1))
					}
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
	
	//not static to not affect other typewriters
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
		
		while(char == eChar.newline) {
			newlines++;
			char = string_ord_at(text, ++stringPointer);
		}
		
		while(char == eChar.squareBracketL) { //advance string pointer, check for command begin
			stringPointer = string_read_terminated(text, ++stringPointer, ["]", ":"], 0);
			if(global.errorCode == eErrorCode.terminatorNotFound) { //incomplete string
				break;
			}
			var cmdName = global.stringReadReturn;
			
			//var isValue = string_ord_at(string, stringPointer) == eChar.dollar;
			
			var args = [];
			var argIndex = 0;
			
			if(string_ord_at(text, stringPointer) == eChar.colon) { //if there even are arguments
				while(string_ord_at(text, ++stringPointer) != eChar.squareBracketR) {
					while(string_ord_at(text, stringPointer) == $20){stringPointer++;} //allow for spaces in between args in the right side
					var argType = string_ord_at(text, stringPointer);
					stringPointer = string_read_terminated(text, ++stringPointer, [",", "]"], 0);
					if(global.errorCode == eErrorCode.terminatorNotFound) { //incomplete string
						break;
					}
					switch(argType) {
						case eChar.hash:
							args[argIndex++] = real(global.stringReadReturn);
							break;
						case eChar.ampersand:
							args[argIndex++] = global.script_variables[?global.stringReadReturn];
							break;
						case eChar.at:
							args[argIndex++] = global.stringReadReturn;
							break;
						default:
							show_error("Invalid midtext command argument type " + chr(argType), 1);
							break;
					}
					if(string_ord_at(text, stringPointer) == eChar.squareBracketR) {
						//stringPointer--; //hacky as fuck but i want to get this done with by 19:00
						break;
					}
				}
			}
			
			switch(cmdName) {
				case "ereset": //reset all effects
					advancer_flags = int64(0);
					advancer_rShakeAmp = 0;
					advancer_vShakeAmp = 0;
					advancer_vShakeFreq = 0;
					advancer_hShakeAmp = 0;
					advancer_hShakeFreq = 0;
					advancer_flags |= eTextFlag.colourChanging; //tell string drawer to change clr too
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
				case "dr": //delay reset
					textSpeed = initTextSpeed;
					break;
				case "d1": //normal delay 1
					textSpeed *= 8;
					break;
				case "d": //delay custom
					textSpeed = real(args[0]);
					break;
				case "message":
					for(var i = 0; i < array_length(args); i++) {
						show_message(args[i]);
					}
					break;
				default:
					show_error("Unknown midtext command " + cmdName, 1);
					break;
			}
			char = string_ord_at(text, ++stringPointer);
			/*while(char == eChar.newline) { //fuckin idk
				newlines++;
				char = string_ord_at(text, ++stringPointer);
			}*/
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
		advancer_flags = int64(0); //reset state of advancer just to be safe
		advancer_rShakeAmp = 0;
		advancer_vShakeAmp = 0;
		advancer_vShakeFreq = 0;
		advancer_hShakeAmp = 0;
		advancer_hShakeFreq = 0;
	}
}