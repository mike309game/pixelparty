if(handlerWaitForInput) {
	if(keyboard_check_pressed(ord("Z"))) {
		handlerWaitForInput = 0;
		alarm[0] = 1;
		exit;
	}
}

