//EVTLIVE;

/*var roomreturn = imgui_step(keyboard_check_pressed(vk_alt));
if(roomreturn & (1 << 31)) {
	roomreturn &= ~(1 << 31);
	global.vars.roomgo = roomreturn;
	global.vars.roompt = 0;
	room_goto(roomreturn);
}*/
//xdraw_sprite_tiled(spr_fullscreen,0,mouse_x,mouse_y);

//old mouse wheel code
/*choosingRoom ^= keyboard_check_pressed(vk_alt);
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
}*/
//label, type, callback, additionalArgs, tapState

if(keyboard_check_pressed(vk_alt)){
	menuShown ^= 1;
	tapDebugListCurrent = tapDebugRooms;
	tapDebugState = 1;
}

if(mouseXOld != window_mouse_get_x() || mouseYOld != window_mouse_get_y()) {
	mouseXOld = window_mouse_get_x();
	mouseYOld = window_mouse_get_y();
	alarm[0] = 60*2;
	debugButtonAlphaSpeed = 0.1;
}

debugButtonAlpha = clamp(debugButtonAlpha + debugButtonAlphaSpeed, 0, 1);

if(menuShown) {
	bgFade = min(bgFade + 0.08, 0.4);
	tapDebug.ProcessCommands(tapDebugListCurrent);
} else {
	bgFade = 0;
	var aabbResult = AABB(mouseXOld, mouseYOld, 0, 32, 32, 32);
	
	pizzaButtonPressed = mouse_check_button(mb_left) && aabbResult;
	
	if(aabbResult && mouse_check_button_released(mb_left)) {
		menuShown = true;
		tapDebugState = 0;
		tapDebugListCurrent = tapDebugMain;
	}
}
