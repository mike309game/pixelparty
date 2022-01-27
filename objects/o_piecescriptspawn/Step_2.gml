easingFocus = clamp(easeHere ? easingFocus + 1 : easingFocus - 1, 0, 60); //80 frames for each goto

global.camX = EaseInOutCubic(oldCameraX, myPiece.x - 160, easingFocus / 60);
global.camY = EaseInOutCubic(oldCameraY, myPiece.y - 120, easingFocus / 60);
CamApply();

if(easingFocus == 0 && !easeHere) {
	AssureGameFlag(eFlag.cameraFocusOnPlayer);
	instance_destroy();
}