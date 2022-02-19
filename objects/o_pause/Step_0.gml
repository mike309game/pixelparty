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
			new MenuItem("Quit"),
		);
		
		switch(menuReturn) {
			case 0:
				menu.canMove = false;
				closing = true;
				break;
			case 1:
				menuMode = 1;
				break;
			case 2:
				menuMode = 2;
				break;
		}
		break;
	case 1:
		menuReturn = PushSimpleOptions(menu);
		if(menuReturn == 3) {
			menuMode = 0;
		}
		break;
	case 2:
		menuReturn = menu.ProcessOptions(
			new MenuItem("Save & quit"),
			new MenuItem("Just Quit"),
			new MenuItem("Nevermind"),
		);
		switch(menuReturn) {
			case 0:
				SaveGame();
				menu.canMove = false;
				waitingForFade = true;
				FadeIn();
				Music(sx_nothing);
				Sound(sx_pause_quit);
				break;
			case 1:
				menu.canMove = false;
				waitingForFade = true;
				FadeIn();
				Music(sx_nothing);
				Sound(sx_pause_quit,0.8);
				break;
			case 2:
				menuMode = 0;
				break;
		}
		break;
}

if(waitingForFade && MANAGER.fadeValue == 1) {
	blackout = true;
	FadeOut();
}
if(blackout && MANAGER.fadeValue == 0) {
	room_goto(r_title);
	instance_destroy();
}