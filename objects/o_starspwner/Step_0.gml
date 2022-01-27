if(mouse_check_button_pressed(mb_left)) {
	repeat 100 begin
	instance_create_depth(mouse_x,mouse_y,0,o_star);end
}