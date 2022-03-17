if(waitingForFade && MANAGER.fadeValue == 1) {
	room_goto(destination);
	SetGameFlag(eFlag.fadeBlack, fadeBlackInDest);
	waitingForFade = false;
}

if(room == destination) {
	if(MANAGER.fadeValue == 0) {
		AllowAllInput();
		UnfreezeAllInput();
		AssureGameFlag(eFlag.playerCanCollide | eFlag.playerCanTransition);
		instance_destroy();
	}
} else {
	if(MANAGER.fadeValue == 1 && room != r_interval) { //fade is done in room, goto interval screen
		room_goto(r_interval);
		alarm[1] = 12;
		NegateGameFlag(eFlag.doFadeIn); //fade out
		if(loadingScreen) {
			Music(sx_nothing);
			alarm[0] = irandom_range(60*5,60*6); //either 5 or 6 seconds of "loading"
		} else {
			MANAGER.fadeValue = 0; //do it immediately only if no loading screen
			alarm[0] = 20; //20 frames of little wait
		}
	}
}

//loading text
for(var i = 0; i < 10; i++) {
	if(--letterCooldown[i] > 0) {
		letterScale[i] = min(letterScale[i] + 0.05, 1.5);
	} else {
		letterScale[i] = max(letterScale[i] - 0.05, 1);
	}
}