// Inherit the parent event
event_inherited();

if(keycheck_pressed(eLetter.x) && dialogueOpen) {
	dialogueSkip = 1;
	event_perform(ev_alarm, 1);
}
//dialogueCanProgress = 0;
while(dialogueCanProgress && dialogueOpen) {
	while(string_char_at(handlerText, dialogueCharCount++) == "\\") {
		//show_message("AAAAAAAAAAAAAAAAAAAAAAAH");
		while(string_char_at(handlerText, dialogueCharCount++) != "\\") {
			//show_message(string_char_at(handlerText, dialogueCharCount));
		}
	}
	if(dialogueCharCount > handlerTextLen) {
		handlerWaitForInput = 1;
		dialogueCanProgress = 0;
		break;
	}
	
	var textDelay = dialogueSkip ? 0 : global.script_variables[? "text delay"];
	if(textDelay != 0) {
		alarm[1] = textDelay;
		dialogueCanProgress = 0;
		audio_play_sound(sx_text_sound,0,0);
		break;
	}
}

//global.script_variables[? "boobie fartfart"] = make_colour_hsv((current_time / 10) & 255, 255, 255);
//show_debug_message((current_time / 20) & 255);
//dialogueCharCount = mouse_x / 10;