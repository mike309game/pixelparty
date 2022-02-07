if(closing) {
	surfaceShow = max(surfaceShow - 1, 0);
	if(surfaceShow == 0) {
		AssureGameFlag(eFlag.playerCanMove | eFlag.playerCanTransition);
		instance_destroy();
	}
} else {
	surfaceShow = min(surfaceShow + 1, 60);
}

var menuReturn;
switch(menuMode) {
	case 0:
		menuReturn = menu.ProcessOptions(
			new MenuItem("Resume"),
			new MenuItem("Options"),
		);
		
		switch(menuReturn) {
			case 0:
				menu.canMove = false;
				closing = true;
				break;
			case 1:
				menuMode = 1;
				break;
		}
		break;
	case 1:
		menuReturn = PushSimpleOptions(menu);
		if(menuReturn == 3) {
			menuMode = 0;
		}
		break;
}