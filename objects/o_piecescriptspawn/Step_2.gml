easingFocus = clamp(easeHere ? easingFocus + 1 : easingFocus - 1, 0, 60); //80 frames for each goto

if(easingFocus == 0 && !easeHere) {
	AssureGameFlag(eFlag.cameraFocusOnPlayer);
	//instance_destroy();
} else {
	global.camX = EaseInOutCubic(oldCameraX, myPiece.x - 160, easingFocus / 60);
	global.camY = EaseInOutCubic(oldCameraY, myPiece.y - 120, easingFocus / 60);
	CamApply();
}
if(!instance_exists(myPiece)) {
	instance_destroy();
	instance_destroy(o_convenientglass);
}