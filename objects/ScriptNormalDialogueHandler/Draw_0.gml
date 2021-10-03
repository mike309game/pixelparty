// Inherit the parent event
event_inherited();

if(dialogueOpen) {
	draw_gui_set;
	draw_sprite(s_textbox_bright, 0, 0, 240-80); //draw textbox sprite
	
	//top leftmost pixel = 18, 198
	var sep = 0;
	var spacing = 0;
	var charCurrent;
	
	for(var i = 1; i <= dialogueCharCount; i++) {
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