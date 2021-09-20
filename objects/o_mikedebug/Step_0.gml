imgui_newframe();

var roomreturn = mike_step(keyboard_check_pressed(vk_alt));
if(roomreturn & (1 << 31)) {
	roomreturn &= ~(1 << 31);
	global.vars.roomgo = roomreturn;
	global.vars.roompt = 0;
	room_goto(roomreturn);
}

imgui_endframe();