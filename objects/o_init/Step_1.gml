enum eInput {
	x = 1 << 0,
	o = 1 << 1,
	square = 1 << 2,
	triangle = 1 << 3,
	
	up = 1 << 4,
	down = 1 << 5,
	left = 1 << 6,
	right = 1 << 7,
	
	start = 1 << 8,
	select = 1 << 9,
	
	l1 = 1 << 10,
	r1 = 1 << 11,
	
	l2 = 1 << 12,
	r2 = 1 << 13,
	
	//Subject to change
	
	interact = eInput.x,
	proceedText = eInput.x,
	skipText = eInput.o
}

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