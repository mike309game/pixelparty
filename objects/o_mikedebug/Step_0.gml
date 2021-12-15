var roomreturn = imgui_step(keyboard_check_pressed(vk_alt));
if(roomreturn & (1 << 31)) {
	roomreturn &= ~(1 << 31);
	global.vars.roomgo = roomreturn;
	global.vars.roompt = 0;
	room_goto(roomreturn);
}
//xdraw_sprite_tiled(spr_fullscreen,0,mouse_x,mouse_y);