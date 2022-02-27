if(canProgress) {
	backgroundAlpha += 0.009;
	if(pxpaScaleCanProgress) {
		pxpaScale = EaseOutElastic(0, 1.0, pxpaScaleProgress / 120);
		pxpaScaleProgress = min(pxpaScaleProgress + 1, 120);
	}
	for(var i = 0; i < 10; i++) {
		if(pxpaLetterResizeCooldown[i]--) {
			pxpaLetterSize[i] = min(pxpaLetterSize[i] + 0.03, 1.2);
		} else {
			pxpaLetterSize[i] = max(pxpaLetterSize[i] - 0.03, 1);
		}
	}
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