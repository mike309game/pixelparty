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
	rainbow = 1 << 3
}

///convert formatted string to ds list for optimized access for the formatted string renderer
function fmtstring_add_to_ord_dslist(list, string){
	var stringLen = string_length(string);
	var char = int64(0); //hopefully saves some convs in the bit stuff below
	for(var i = 1; i <= stringLen; i++) {
		char = string_ord_at(string, i);
		while(char == eLetter.backslash) { //process command
			ds_list_add(list, 12121212); //tell drawer that there's a command
			var cmd = string_lower(string_copy(string, ++i, COMMANDSIZE)); //get command
			i += COMMANDSIZE; //skip to arg type
			ds_list_add(list, string_ord_at(string, i) == eLetter.dollar); //tell if arg is value
			var arg = "";
			while(string_ord_at(string, ++i) != eLetter.backslash) {
				arg += string_char_at(string, i);
			}
			ds_list_add(list, arg);
			switch(cmd) {
				case "colour":
					ds_list_add(list, eTextCommand.colour);
					break;
				default:
					show_error(string + " UNIMPLEMENTED", 0);
					break;
			}
			char = string_ord_at(string, ++i); //out of terminator
		}
		ds_list_add(list, char);
	}
	return 0;
}

function fmtstring_draw(xx, yy, charList, start, count) {
	var sep = 0;
	var spacing = 0;
	var charCurrent = int64(0);
	var countReal = count; //don't subtract for each letter
	for(var i = start; i < countReal; i++) {
		while(charList[|i] == 12121212) { //current char is 0? (is command indicator)
			//show_debug_message("FOUND INDICATOR: ord=" + string(charList[|i]) + " chr=" + chr(charList[|i]) + " idx=" + string(i));
			//is variable? advance
			//it is? get variable from current item, advance to command id
			//it's not? use current item as arg, advance to command id
			var arg = charList[|++i] ? global.script_variables[? charList[|++i]] : charList[|++i];
			switch(charList[|++i]) {
				case eTextCommand.colour:
					draw_set_colour(arg);
					break;
				default:
					show_error("WHAT THE SHIT", 0);
					break;
			}
			i++;
			//show_debug_message("AFTER: ord=" + string(charList[|i]) + " chr=" + chr(charList[|i]) + " idx=" + string(i));
		}
		charCurrent = charList[|i]; //store current char
		
		var charSep = global.JaxFont_widths[?charCurrent];
		if(charSep == undefined) {
			charSep = 4;
		}
		
		var charOffset = global.JaxFont_offsets[?charCurrent];
		if(charOffset == undefined /*|| sep == 0*/) {
			charOffset = 0;
		}
		
		sep -= charOffset;
		draw_text(xx + sep, yy + spacing, chr(charCurrent));
		sep += charSep+charOffset+1;
	}
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