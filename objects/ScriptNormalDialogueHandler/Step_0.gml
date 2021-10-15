// Inherit the parent event
event_inherited();

if(keycheck_pressed(eLetter.x) && dialogueOpen) {
	dialogueSkip = 1;
	event_perform(ev_alarm, 1);
}

while(dialogueCanProgress && dialogueOpen) {
	dialogueCharCount++;
	if(dialogueCharCount > handlerTextLen) {
		dialogueCharCount--;
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