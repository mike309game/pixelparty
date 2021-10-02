// Inherit the parent event
event_inherited();

while(dialogueCanProgress && dialogueOpen) {
	dialogueCharCount++;
	if(dialogueCharCount > handlerTextLen) {
		dialogueCharCount--;
		handlerWaitForInput = 1;
		dialogueCanProgress = 0;
		break;
	}
	
	var textDelay = global.script_variables[? "text delay"];
	if(textDelay != 0) {
		alarm[1] = textDelay;
		dialogueCanProgress = 0;
		audio_play_sound(sx_text_sound,0,0);
		break;
	} /*else {
		if(dialogueCharCount > handlerTextLen) {
			break;
		}
	}*/
}