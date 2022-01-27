if(mouse_check_button_pressed(mb_left)) begin
	instance_create_depth(mouse_x,mouse_y,0,object_index);
	instance_destroy() end