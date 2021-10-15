if(handlerWaitForInput) {
	if(keycheck_pressed(eLetter.z)) {
		handlerWaitForInput = 0;
		alarm[0] = 1;
		exit;
	}
}

