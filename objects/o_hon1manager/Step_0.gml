
if(mannyYSinEnabled) {
	mannyYSinAmp = min(mannyYSinAmp + 0.08, 8);
	
} else {
	mannyYSinAmp = max(mannyYSinAmp - 0.08, 0);
}
mannyYSin = sin(global.time / 30) * mannyYSinAmp;

backgroundAlpha -= 0.04 * backgroundFadeOut;

switch(state) {
	case 1:			//increase manny's alpha, make him smaller, get him in the center
		//multiplying the stuff like this is like lerp except it's not lerp
		mannyY *= 0.9893; //decrease manny's additional y
		mannyScale *= 0.986; //decrease manny's scale
		
		if(decreaseWhiteAlpha) {
			mannyWhiteAlpha -= 0.01;
			mannyAlpha += 0.01;
		} else {
			mannyWhiteAlpha += 0.01; //increase manny visibility
		}
		if(mannyAlpha > 3) {
			state++; //go to state that does nothing, just waits
			mannyYSinEnabled = true;
			mannyScale = 0;
			mannyY = 0;
			alarm[1] = 120; //in 2 seconds go to the manny ease up state
		}
		break;
	case 2: //doing nothing, just waiting
		
		break;
	case 3:			//manny goes above
		if(mannyYProgress == 300) { //if animation finished
			state++; //waiting again
			alarm[3] = 60; //after a second, stop the siner
			alarm[4] = 60*4; //three seconds after that, go to next state
			mannyYSpeed = -2.5; //when manny starts falling, make him go up a lil
		} else {
			mannyYProgress = min(++mannyYProgress, 300);
			mannyY = EaseInOutCubic(0,-80,mannyYProgress / 300);
		}
		break;
	case 4: //another waiting state
		break;
	case 5: //manny falls
		mannyYSpeed += 0.1;
		mannyY += mannyYSpeed;
		if(mannyY >= 44) {
			obj_player.visible = true;
			obj_player.sprite_index = s_manny_storyofundertale;
			mannyAlpha = 0;
			randomShakeAmp = 3;
			state++; //go to state that updates camera shake
			alarm[1] = 60*3; //in 3 seconds, go to honestary text show state
		}
		break;
	case 6: //update camera shake, wait for alarm 1
		SetCamPos((x - 160) + irandom_range(-randomShakeAmp,randomShakeAmp), (y - 120) + irandom_range(-randomShakeAmp,randomShakeAmp), true);
		break;
	case 7: //spawn hon 1 text effect
		instance_create_depth(0,0,-99,o_texteffect);
		Music(mx_honest1); //play hon1 music
		state++;
		break;
	case 8: //wait for text effect to die
		if(!instance_exists(o_texteffect)) {
			state++; //go to focusing on player
		}
		break;
	case 9: //focus on player
		playerCamFocusProgress = min(playerCamFocusProgress + 1, 120);
		
		SetCamPos(
			EaseInOutCubic(x - 160, playerCamFocusX, playerCamFocusProgress / 120),
			EaseInOutCubic(y - 120, playerCamFocusY, playerCamFocusProgress / 120),true
		);
		
		if(playerCamFocusProgress == 120) {
			state++; //wait state
			alarm[1] = 60; //in 1 second spawn interpreter
			AssureGameFlag(eFlag.cameraFocusOnPlayer); //the camera can center on the player now
		}
		break;
	case 10: //wait
		 break;
	case 11: //just make the interpreter
		interpreter = QuickInterpreter("honestary1-OpeningCutsceneHonstayDialogue");
		state++;
		break;
	case 12: //wait for interpreter to die
		if(!instance_exists(interpreter)) {
			global.script_variables[? "honestary1-seenIntro"] = 1;
			AssureGameFlag(eFlag.playerCanMove | eFlag.playerCanCollide | eFlag.playerCanInteract | eFlag.playerCanTransition);
			instance_destroy();
		}
		break;
}

randomShakeAmp = max(randomShakeAmp - 0.1, 0);