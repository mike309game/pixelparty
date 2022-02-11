if(GetInputPressed(eInput.x)) {
	waitingForFade = true;
	MANAGER.fadeSpeed = 0.04;
	FadeIn();
}
if(waitingForFade && MANAGER.fadeValue == 1) {
	instance_create_depth(0,0,0,o_lnxletter);
	FadeOut();
	instance_destroy();
}