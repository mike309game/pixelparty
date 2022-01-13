if(waitingForFade && MANAGER.fadeValue == 1) {
	room_goto(destination);
	waitingForFade = false;
}

if(room == destination) {
	if(MANAGER.fadeValue == 0) {
		AllowAllInput();
		UnfreezeAllInput();
		AssureGameFlag(eFlag.playerCanCollide);
		instance_destroy();
		exit;
	}
} else {
	if(MANAGER.fadeValue == 1 && room != r_interval) { //fade is done in room, goto interval screen
		room_goto(r_interval);
		NegateGameFlag(eFlag.doFadeIn); //fade out
		if(loadingScreen) {
			alarm[0] = irandom_range(60*5,60*6); //either 5 or 6 seconds of "loading"
		} else {
			MANAGER.fadeValue = 0; //do it immediately only if no loading screen
			alarm[0] = 20; //20 frames of little wait
		}
	}
}