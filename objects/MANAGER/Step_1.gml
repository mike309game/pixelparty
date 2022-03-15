if(room != r_init) {
	if(global.inputMode < 2) {
		//Set continuous input
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