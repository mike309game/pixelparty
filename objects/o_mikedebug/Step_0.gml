/*var roomreturn = imgui_step(keyboard_check_pressed(vk_alt));
if(roomreturn & (1 << 31)) {
	roomreturn &= ~(1 << 31);
	global.vars.roomgo = roomreturn;
	global.vars.roompt = 0;
	room_goto(roomreturn);
}*/
//xdraw_sprite_tiled(spr_fullscreen,0,mouse_x,mouse_y);

choosingRoom ^= keyboard_check_pressed(vk_alt);
if(choosingRoom) {
	//if(os_switch) {
		//roomChosen = nmod(roomChosen + (GetInput(eInput.down, true) - GetInput(eInput.up, true)),roomCount);
	//} else {
		roomChosen = nmod(roomChosen + (mouse_wheel_down() - mouse_wheel_up()),roomCount);
	//}
	smoothSpacing = lerp(smoothSpacing, roomChosen * 15, 0.08);
	bgFade = min(bgFade + 0.08, 0.4);
	if(mouse_check_button_pressed(mb_left)) {
		var theRoom = asset_get_index(roomList[|roomChosen]);
		choosingRoom = false;
		bgFade = 0;
		room_goto(theRoom);
	}
} else {
	bgFade = 0;
}
if keyboard_check_pressed(ord("L")) then QuickInterpreter("level1-LexsieDialogue");