
for(var i = 0; i < 10; i++) {
	if(pxpaLetterResizeCooldown[i]--) {
		pxpaLetterSize[i] = min(pxpaLetterSize[i] + 0.03, 1.2);
	} else {
		pxpaLetterSize[i] = max(pxpaLetterSize[i] - 0.03, 1);
	}
}

switch(state) {
	case 0:
		break;
	case 1:
		pxpaScale = EaseOutElastic(0, 1.4, pxpaScaleProgress / 120);
		pxpaScaleProgress = min(pxpaScaleProgress + 1, 120);
		copyrightAlpha += 0.1;
		break;
	case 2:
		if(GetInput(eInput.start)) {
			Sound(sx_title_select);
			state++; //go to start blinking state
			alarm[3] = 60; //after 1 second go to choicers state
		}
		break;
	case 3:
		if(global.time % 10 == 0) { //every 20 frames, blink the start prompt
			startAlpha ^= 1;
		}
		break;
	case 4:
		choicersProgress = min(choicersProgress + 1, 100);
		pxpaScale = EaseInOutCubic(1.4, 1, choicersProgress / 100);
		pxpaY = EaseInOutCubic(120, 40, choicersProgress / 100);
		startY = EaseInCubic(200, 2000, choicersProgress / 100); //very far away
		backgroundColour = merge_colour(0xFFB255, 0xa755ff, min(choicersProgress,60) / 60);
		bluePlanesZ = EaseInCubic(80, 1000, choicersProgress / 100);
		redPlanesZ = EaseOutCubic(1000, 80, choicersProgress / 100);
		choicerY[0] = EaseInOutBack(300, 145, min(choicersProgress+20,100) / 100);
		choicerY[1] = EaseInOutBack(300, 145, min(choicersProgress+10,100) / 100);
		choicerY[2] = EaseInOutBack(300, 145, choicersProgress / 100);
		if(choicersProgress == 100) { //anim is done
			state++; //go to chooseable state
		}
		break;
	case 5:
		choicerChoice = nmod(choicerChoice + GetInputPressed(eInput.right,true) - GetInputPressed(eInput.left,true), 3);
		if(GetInput(eInput.x)) {
			state++; //choicer zooming in state
		}
		break;
	case 6:
		/*if(choicerSelectedProgress[choicerChoice] == 45) {
			//choicerX[choicerChoice] = 0;
			//choicerZ[choicerChoice] = 0;
			//choicerSelectedProgress[choicerChoice] = 0;
			state = 7 + choicerChoice;
			break;
		}
		choicerSelectedProgress[choicerChoice] = min(choicerSelectedProgress[choicerChoice] + 1, 45);
		choicerX[choicerChoice] = lengthdir_x(choicerSelectedProgress[choicerChoice]*3.5, choicerDir[choicerChoice]);
		choicerZ[choicerChoice] = lengthdir_y(choicerSelectedProgress[choicerChoice]*-3.5, choicerDir[choicerChoice]);*/
		//12 * 5 = 60 for the z
		if(choicerSelectedProgress[choicerChoice] == 45) {
			//choicerX[choicerChoice] = 0;
			//choicerZ[choicerChoice] = 0;
			//choicerSelectedProgress[choicerChoice] = 0;
			state = 7 + choicerChoice;
			break;
		}
		var targetX;
		var progressNormalised = choicerSelectedProgress[choicerChoice]++ / 45;
		switch(choicerChoice) {
			case 0:
				targetX = 59;
				break;
			case 1:
				targetX = (59 + ((160-59) * 1));
				break;
			case 2:
				targetX = (59 + ((160-59) * 2));
				break;
		}
		choicerX[choicerChoice] = lerp(targetX, 160, progressNormalised);
		choicerZ[choicerChoice] = lerp(0, -120, progressNormalised);
		break;
	case 7:
	case 8:
		state = 5;
		ResetChoicerZoomAnim();
		break;
	case 9:
		var menuReturn = PushSimpleOptions(optionsMenu);
		if(menuReturn == 3) {
			ResetChoicerZoomAnim();
			state = 5;
		}
		break;
}

debugPlacer ^= keyboard_check_pressed(vk_delete);
if(debugPlacer) {
	debugChangingWhat += keyboard_check_pressed(eChar.w) - keyboard_check_pressed(eChar.q);
	switch(debugChangingWhat) {
		case 0:
			debugChangingVariable = "uiX";
			debugChangingRate = 8;
			break;
		case 1:
			debugChangingVariable = "uiY";
			debugChangingRate = 8;
			break;
		case 2:
			debugChangingVariable = "uiZ";
			debugChangingRate = 8;
			break;
		case 3:
			debugChangingVariable = "uiXRot";
			debugChangingRate = 5;
			break;
		case 4:
			debugChangingVariable = "uiYRot";
			debugChangingRate = 5;
			break;
		case 5:
			debugChangingVariable = "uiZRot";
			debugChangingRate = 5;
			break;
	}
	variable_instance_set(id, debugChangingVariable, variable_instance_get(id, debugChangingVariable) + (keyboard_check_pressed(vk_add) - keyboard_check_pressed(vk_subtract)) * debugChangingRate)
}