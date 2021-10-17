// Inherit the parent event
event_inherited();

if(dialogueOpen) {
	draw_gui_set;
	draw_sprite(s_textbox_bright, 0, 0, 240-80); //draw textbox sprite
	
	//top leftmost pixel = 18, 198
	var sep = 0;
	var spacing = 0;
	var charCurrent;
	
	draw_set_colour(0);
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
		if(charOffset == undefined /*|| sep == 0*/) {
			charOffset = 0;
		}
		
		sep -= charOffset;
		draw_text(18 + sep, 198 + spacing, charCurrent);
		sep += charSep+charOffset+1;
	}
	
	if(handlerWaitForInput) {
		draw_sprite(s_psxbuttons_frames, 0, 288, 225);
	}
	
	draw_gui_exit;
}