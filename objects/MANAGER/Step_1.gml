//EVTLIVE;
global.windowWidth = window_get_width();
global.windowHeight = window_get_height();
global.windowCenterX = global.windowWidth / 2;
global.windowCenterY = global.windowHeight / 2;
global.gameSurfaceScale = floor(min(global.windowWidth / 320, global.windowHeight / 240)); //get biggest possible integer scale

//show_debug_message(device_mouse_raw_x(0));

if(room != r_init) {
	if(global.inputMode < 2) {
		//Set continuous input
		if(os_type == os_android) {
			for(var i = 0; i < array_length(touchInputInfo); i++) {
				var realX = (touchInputInfo[i][0] * global.gameSurfaceScale + global.windowCenterX) - 160 * global.gameSurfaceScale;
				var realY = (touchInputInfo[i][1] * global.gameSurfaceScale + global.windowCenterY) - 120 * global.gameSurfaceScale;
				var sizeScaled = 32 * global.gameSurfaceScale;
				var state = false;
				var touchX = 0;
				var touchY = 0;
				for(var j = 0; (j < 8) && !state; j++) {
					touchX = device_mouse_raw_x(j);
					touchY = device_mouse_raw_y(j);
					state = AABB(touchX, touchY, realX, realY, sizeScaled, sizeScaled) && device_mouse_check_button(j, mb_left);
				}
				
				/*var state = (
					mouse_check_button(mb_left) &&
					touchX < (realX + sizeScaled) &&
					touchX >= realX &&
					touchY < (realY + sizeScaled) &&
					touchY >= realY); //aabb*/
				//show_debug_message("idx " + string(i) + ": " + string(state));
				if(!state && touchInputInfo[i][3]) { //we released the key
					keyboard_key_release(touchInputInfo[i][2]);
					touchInputInfo[i][3] = false;
				} else if(state && !touchInputInfo[i][3]) { //we pressed the key
					keyboard_key_press(touchInputInfo[i][2]);
					touchInputInfo[i][3] = true;
				}
			}
		}
		ProcessInput();
		if(global.inputMode == 1) {
			buffer_write(global.inputBuffer, buffer_u16, global.input);
			buffer_write(global.inputBuffer, buffer_u16, global.inputPressed);
			buffer_write(global.inputBuffer, buffer_u16, global.inputReleased);
			global.inputBufferSize += 2*3;
		}
	} else if(buffer_tell(global.inputBuffer) != global.inputBufferSize){
		global.input = buffer_read(global.inputBuffer, buffer_u16);
		global.inputPressed = buffer_read(global.inputBuffer, buffer_u16);
		global.inputReleased = buffer_read(global.inputBuffer, buffer_u16);
	} else {
		global.inputMode = 0;
	}
}

//this is here so if the game pauses the player immediately freezes
if(!instance_exists(o_pause)) {
	if(GetInput(eInput.start) && GetGameFlag(eFlag.playerCanMove | eFlag.playerCanTransition)) {
		NegateGameFlag(eFlag.playerCanMove | eFlag.playerCanTransition);
		instance_create_depth(0,0,-16000,o_pause)
		//show_message("create")
	}
}
