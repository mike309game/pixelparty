dlgPointer = clamp(dlgPointer + (keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)),0,string_length(dlgString));

if(keyboard_check_pressed(vk_tab)) {
	dlgString = string_replace_all(get_string("enter dialogue text (\\n = newline)",string_replace_all(dlgString,"\n","\\n")),"\\n","\n");
	dlgPointer = 0;
	with(typewriter) {
		//characterCount = -1;
		ClearLetterList(letterList);
		letterListLen = 0;
		text = other.dlgString;
		textLen = string_length(other.dlgString);
		textPointer = 0;
		canAdvance = 1
	}
}

if(keyboard_lastkey != -1) {
	var ordChar = string_ord_at(keyboard_lastchar,1);
	if(keyboard_lastkey == vk_enter) {
		dlgString = string_insert("\n",dlgString,++dlgPointer);
	} else if(keyboard_lastkey == vk_backspace && dlgPointer > 0){
		dlgString = string_delete(dlgString, dlgPointer--,1);
	} else if(ordChar > 31 && ordChar < 127){
		dlgString = string_insert(keyboard_lastchar,dlgString,++dlgPointer);
	}
	keyboard_lastkey = -1;
	keyboard_lastchar = "";
	with(typewriter) {
		//characterCount = -1;
		ClearLetterList(letterList);
		letterListLen = 0;
		text = other.dlgString;
		textLen = string_length(other.dlgString);
		textPointer = 0;
		canAdvance = 1
	}
}

//eat shit
try {
	typewriter.Step();
} catch(myNadsBitch) {}