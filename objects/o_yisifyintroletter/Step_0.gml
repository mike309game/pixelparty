if(GetInputPressed(eInput.x)) {
	waitingForFade = true;
	FadeIn();
	NegateGameFlag(eFlag.fadeBlack);
}
if(waitingForFade && MANAGER.fadeValue == 1) {
	FadeOut();
	MANAGER.fadeSpeed = 0.04;
	room_goto(r_title);
}
if(floor(image_index) != oldidx) {
	MANAGER.fadeValue = 0.7;
	MANAGER.fadeSpeed = 0.05;
	NegateGameFlag(eFlag.fadeBlack);
	with(instance_create_depth(x,y,0,o_yisifyintrobg)) {
		image_index = irandom_range(0,4);
		speed = 1;
		direction = random_range(0,360);
		friction = 0.03;
	}
}
oldidx = floor(image_index);