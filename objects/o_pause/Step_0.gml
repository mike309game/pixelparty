var menuReturn;
switch(menuMode) {
	case 0:
		menuReturn = menu.ProcessOptions(
			new MenuItem("test"),
			new MenuItem("another test"),
			new MenuItem("Balls"),
			new MenuItem("in your mouth"),
			new MenuItem("fucking Bitch!!!!!!!"),
		);
		if(menuReturn == 1) {
			menuMode = 1;
		}
		break;
	case 1:
		menuReturn = menu.ProcessOptions(
			new MenuItem("wow you pressed that second button"),
			new MenuItem("don't press here to go back"),
			new MenuItem("don't press here to go back"),
			new MenuItem("press here to go back"),
			new MenuItem("don't press here to go back"),
			new MenuItem("don't press here to go back"),
			new MenuItem("don't press here to go back"),
		);
		if(menuReturn == 3) {
			menuMode = 0;
		}
		break;
}