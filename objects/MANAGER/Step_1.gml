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