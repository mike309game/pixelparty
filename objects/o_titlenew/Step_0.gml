
//backgroundAlpha += 0.009;
if(state > 0) { //if 1 or above, it means we wanna show the logo
	pxpaScale = EaseOutElastic(0, 1.0, pxpaScaleProgress / 120);
	pxpaScaleProgress = min(pxpaScaleProgress + 1, 120);
}
if(state > 3) { //if 4 or above, smooth in prompts
	choicersProgress = min(choicersProgress + 1, 100);
	pxpaZ = EaseInOutCubic(-20, 0, choicersProgress / 100);
	pxpaY = EaseInOutCubic(120, 50, choicersProgress / 100);
	startY = EaseInCubic(200, 2000, choicersProgress / 100); //very far away
	backgroundColour = merge_colour(0xFFB255, 0xa755ff, min(choicersProgress,60) / 60);
	bluePlanesZ = EaseInCubic(80, 1000, choicersProgress / 100);
	redPlanesZ = EaseOutCubic(1000, 80, choicersProgress / 100);
	choicersY = EaseOutCubic(1500, 127, choicersProgress / 100);
}
for(var i = 0; i < 10; i++) {
	if(pxpaLetterResizeCooldown[i]--) {
		pxpaLetterSize[i] = min(pxpaLetterSize[i] + 0.03, 1.2);
	} else {
		pxpaLetterSize[i] = max(pxpaLetterSize[i] - 0.03, 1);
	}
}

switch(state) {
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