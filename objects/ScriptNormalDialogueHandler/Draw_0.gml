// Inherit the parent event
event_inherited();

if(handlerProcessText) {
	draw_gui_set;
	draw_sprite(s_textbox_bright, 0, 0, 240-80); //draw textbox sprite
	
	//top leftmost pixel = 18, 198
	
	fmtstring_draw(18, 198, typewriter.letterList, 0);
	
	if(handlerWaitForInput) {
		draw_sprite(s_psxbuttons_frames, 0, 288, 225);
	}
	
	draw_gui_exit;
}