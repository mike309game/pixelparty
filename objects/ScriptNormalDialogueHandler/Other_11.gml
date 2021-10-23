// Inherit the parent event
event_inherited();
with(typewriter) {
	canAdvance = 1;
	text += other.handlerText;
	textLen = string_length(text);
}