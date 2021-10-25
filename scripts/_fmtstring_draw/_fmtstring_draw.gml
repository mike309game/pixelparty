/*


WHY MAKE THE STRING A DS LIST?
because string_char_at will ALWAYS read the WHole string to return a value because of unicode
it's vastly faster to just have a ds list with ords (cuz string operations are slow)
the cons of this is that all strings being drawn with this need to be transformed into a ds list, which can be annoying


*/

#macro COMMANDSIZE 6

enum eTextCommand {
	colour,
	
	rShake, //toggle random shake
	rShAmp, //random shake amplification
	
	vShake, //toggle vertical sin
	vShAmp, //vertical sin amplification
	vShFrq, //vertical sin frequency
	
	hShake, //toggle horizontal cos
	hShAmp, //horizontal cos amplification
	hShFrq, //horizontal cos frequency
	
	rainbw, //rainbow effect
	sReset, //reset and toggle all shakes off
}

enum eTextFlag {
	vertShake = 1 << 0,
	horzShake = 1 << 1,
	randomShake = 1 << 2,
	rainbow = 1 << 3,
	colourChanging = 1 << 4
}

function Letter(
	//common
	_char, _flags, _txptrdiff, _colour = 0, _alpha = 1,
	//random shake
	_rshake_amp = 0,
	//vertical shake
	_vshake_amp = 0, _vshake_freq = 0,
	//horizontal shake
	_hshake_amp = 0, _hshake_freq = 0
) constructor {
	x = 0; //x offset (for shake)
	y = 0; //y offset (for shake)
	char = _char;
	sep = global.JaxFont_widths[?char];
	if(sep == undefined) {
		sep = 4;
	}
	offset = global.JaxFont_offsets[?char];
	if(offset == undefined) {
		offset = 0;
	}
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

function AdvanceLetterList(letterList, string, stringPointerOriginal) {
	gml_pragma("forceinline");
	var stringPointer = stringPointerOriginal;
	
	var colour = 0;
	var alpha = 1;
	static flags = int64(0);
	static rShakeAmp = 0;
	static vShakeAmp = 0;
	static vShakeFreq = 0;
	static hShakeAmp = 0;
	static hShakeFreq = 0;
	
	while(string_ord_at(string, ++stringPointer) == eChar.backslash) { //advance string pointer, check for command begin
		var findResult = string_read_terminated(string, ++stringPointer, ["["], 0);
		stringPointer = findResult[1];
		var cmdName = findResult[0];
		
		//var isValue = string_ord_at(string, stringPointer) == eChar.dollar;
		
		var args = [];
		var argIndex = 0;
		
		while(string_ord_at(string, ++stringPointer) != eChar.squareBracketR) {
			while(string_ord_at(string, stringPointer) == $20){stringPointer++;} //allow for spaces in between args in the right side
			var argType = string_ord_at(string, stringPointer);
			findResult = string_read_terminated(string, ++stringPointer, [",", "]"], 0);
			stringPointer = findResult[1];
			if(string_ord_at(string, stringPointer) == eChar.squareBracketR) {
				stringPointer--; //hacky as fuck but i want to get this done with by 19:00
			}
			switch(argType) {
				case eChar.hash:
					args[argIndex++] = real(findResult[0]);
					break;
				case eChar.dollar:
					args[argIndex++] = global.script_variables[?findResult[0]];
					break;
				case eChar.at:
					args[argIndex++] = findResult[0];
					break;
				default:
					show_error("FUCK", 1);
					break;
			}
		}
		
		switch(cmdName) {
			case "ereset":
				flags = 0;
				rShakeAmp = 0;
				vShakeAmp = 0;
				vShakeFreq = 0;
				hShakeAmp = 0;
				hShakeFreq = 0;
				break;
			case "colour":
				flags |= eTextFlag.colourChanging;
				colour = real(args[0]);
				alpha = real(args[1]);
				break;
			case "rainbw":
				flags ^= eTextFlag.rainbow;
				break;
			case "rshake":
				flags ^= eTextFlag.randomShake;
				rShakeAmp = real(args[0]);
				break;
			case "hshake":
				flags ^= eTextFlag.horzShake;
				break;
			case "hshamp":
				hShakeAmp = real(args[0]);
				break;
			case "hshfrq":
				hShakeFreq = real(args[0]);
				break;
			default:
				show_error("bummer", 1);
				break;
		}
	}
	ds_list_add(letterList, new Letter(
		string_char_at(string, stringPointer),
		flags, (stringPointer - stringPointerOriginal),
		colour, alpha, rShakeAmp, vShakeAmp, vShakeFreq, hShakeAmp, hShakeFreq
	));
	flags &= ~(eTextFlag.colourChanging); //this isn't toggleable so it has to be reset
	return stringPointer;
}

function RegressLetterList(letterList, stringPointerOriginal) {
	gml_pragma("forceinline");
	var item = ds_list_size(letterList)-1;
	var ptrDecreased = stringPointerOriginal - letterList[|item].textPointerDifference;
	delete letterList[|item];
	ds_list_delete(letterList, item);
	return ptrDecreased;
}

function ClearLetterList(letterList) {
	gml_pragma("forceinline");
	var listLen = ds_list_size(letterList);
	for(var i = 0; i < listLen; i++) {
		delete letterList[|i];
	}
	ds_list_clear(letterList);
}

function fmtstring_draw(xx, yy, letterList, start) {
	var sep = 0;
	var spacing = 0;
	var letterCurrent = noone;
	var count = ds_list_size(letterList);
	draw_set_colour(0);
	for(var i = start; i < count; i++) {
		letterCurrent = letterList[|i];
		
		if(letterCurrent.flags & eTextFlag.colourChanging) {
			draw_set_colour(letterCurrent.colour);
			draw_set_alpha(letterCurrent.alpha);
		}
		if(letterCurrent.flags & eTextFlag.rainbow) {
			draw_set_colour(make_colour_hsv((global.time + i*10) & 0xff, 255, 255));
		}
		
		letterCurrent.Update(i);
		
		var charSep = letterCurrent.sep;
		
		var charOffset = letterCurrent.offset;
		
		sep -= charOffset;
		draw_text((xx + sep) + letterCurrent.x, (yy + spacing) + letterCurrent.y, letterCurrent.char);
		sep += charSep+charOffset+1;
	}
	draw_set_colour(c_white);
}

//REFERENCE
/*
for(var i = 1; i < dialogueCharCount; i++) {
	//text commands (shake, colour, speed) only have one argument (MIGHT BE CHANGED LATER IDK)
	//this is a while so commands can be right next to each other
	while(string_char_at(handlerText, i) == "\\") { //character is command identifier?
		var cmd;
		var arg = "";
		var argIsValue;
		
		cmd = string_lower(string_copy(handlerText, ++i, 3)); //get out of \ and store command name
		i += 3; //advance to argument identifier
		argIsValue = string_char_at(handlerText, i) == "$"; //get if argument is referece to value
		while(string_char_at(handlerText, ++i) != "\\") { //advance to next character and check if command reading finished
			arg += string_char_at(handlerText, i); //store character of argument
		}
		i++; //get out of command terminator
		switch(cmd) { //handle command
			default:
				ScriptSysWarning("Section " + myHandler.sectionName + " contains text command which utilizes invalid command " + cmd);
				break;
			case "clr":
				draw_set_colour(argIsValue ? global.script_variables[? arg] : real(arg));
				break;
		}
	}
	
	charCurrent = string_char_at(handlerText, i);
	
	var charSep = global.JaxFont_widths[?charCurrent];
	if(charSep == undefined) {
		charSep = 4;
	}
	
	var charOffset = global.JaxFont_offsets[?charCurrent];
	if(charOffset == undefined /*|| sep == 0*//*) {
		charOffset = 0;
	}
	
	sep -= charOffset;
	draw_text(18 + sep, 198 + spacing, charCurrent);
	sep += charSep+charOffset+1;
}
*/



/*var test = @"test\colour#4484541\blah \colour#5515844\blah \colour#121345\blah \colour#78787\blah";
var list = ds_list_create();
fmtstring_add_to_ord_dslist(list, test);
show_message("stop");*/