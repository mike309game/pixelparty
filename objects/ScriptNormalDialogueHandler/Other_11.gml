// Inherit the parent event
event_inherited();
with(typewriter) {
	canAdvance = 1;
	ds_list_clear(letterList);
	fmtstring_add_to_ord_dslist(letterList, other.handlerText);
	letterListLength = ds_list_size(letterList);
}
//dialogueCanProgress = 1;
//ds_list_clear(dialogueLetters);
//fmtstring_add_to_ord_dslist(dialogueLetters, handlerText);
//handlerTextLen = ds_list_size(dialogueLetters);