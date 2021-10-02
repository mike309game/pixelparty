if(handlerWaitForInput) {
	if(keyboard_check_pressed(ord("Z"))) {
		handlerWaitForInput = 0;
		event_perform(ev_alarm, 0);
		exit;
	}
}

