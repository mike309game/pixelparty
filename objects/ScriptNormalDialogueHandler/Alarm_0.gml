// Inherit the parent event
event_inherited();

dialogueSkip = 0;
if(global.script_variables[? "text auto clear"]) {
	dialogueCharCount = 0;
	//dialogueCanProgress = 1;
	handlerText = "";
	handlerTextLen = 0;
}