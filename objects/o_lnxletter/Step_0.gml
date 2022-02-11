if(GetInputPressed(eInput.x) && image_index == 4) {
	waitingForFade = true;
	FadeIn();
}
image_alpha += 0.1;
if(MANAGER.fadeValue == 1 && waitingForFade) {
	FadeOut();
	instance_create_depth(160,120,0,o_yisifyintrobg);
	instance_create_depth(160,120,-1,o_yisifyintroletter);
	instance_destroy(object_index);
	instance_destroy(o_lnxdust);
	exit;
}
if(global.time % 2) exit;
var xx,yy;
if(image_index == 0) {
	xx = irandom_range(32,48);
	yy = irandom_range(90,115);
	with(instance_create_depth(xx,yy,0,o_lnxdust)) {
		hspeed = random_range(-0.1,-0.5);
		vspeed = random_range(-0.1,-0.3);
	}
} else if(image_index == 2) {
	xx = irandom_range(233,255);
	yy = irandom_range(72,111);
	with(instance_create_depth(xx,yy,0,o_lnxdust)) {
		hspeed = random_range(0.1,0.5);
		vspeed = random_range(-0.1,-0.3);
	}
}