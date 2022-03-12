if(global.script_variables[? "honestary1-seenIntro"]) {
	Music(mx_honest1);
	instance_destroy();
	exit;
}

interpreter = noone;

alarm[11] = 1; //in 1 frame set the default cam pos, cuz room create event of the manager obj is done after room instance create events
NegateGameFlag(eFlag.playerCanSetSprite | eFlag.cameraFocusOnPlayer | eFlag.playerCanMove); //we need to set its sprite to the fallen down one, then enable the flag again

obj_player.visible = false; //yes, it will crash when there's no player, cry about it

depth = -14000;

playerCamFocusX = GetHitboxCenterX(obj_player) - 160;
playerCamFocusY = GetHitboxCenterY(obj_player) - 120;
playerCamFocusProgress = 0; //0-120

state = 0;

backgroundAlpha = 1;
backgroundFadeOut = false;

mannyYProgress = 0; //0-300
mannyYSpeed = 0;
mannyY = -120;

mannyYSinEnabled = false;
mannyYSin = -120;
mannyYSinAmp = 0;

mannyScale = 6;
mannyAlpha = 0;

mannyWhiteAlpha = 0; //alpha of the white only sprite
decreaseWhiteAlpha = false; //in state 1, wether to decrease the white alpha and increase the normal alpha

randomShakeAmp = 0;

//we start @ alarm 1 because of the script interpreter using alarm zero
alarm[1] = 120; //after 2 secs, go to state 1, start showing manny
alarm[2] = 120 + 120; //after 4 secs, fade in the normal manny and fade out the white manny