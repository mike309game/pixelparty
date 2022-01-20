if(!instance_exists(obj_player)) {
	instance_destroy();
}


if(point_distance(x,y,obj_player.x,obj_player.y) < 90 || broken) {
	image_index = lerp(image_index, 36, 0.15);
	breakCounter++;
} else if(!broken) {
	image_index = lerp(image_index, 0, 0.15);
	breakCounter++;
}

if(floor(image_index) == 0 || ceil(image_index) == 36) {
	breakCounter = 0;
}
if(breakCounter == 130 && !broken) {
	broken = true;
	shakeAmt = 5;
}

SetDepth();

x = xstart + ((global.time % 2) == 0 ? shakeAmt : -shakeAmt);
shakeAmt /= 1.2;//max(shakeAmt - 1, 0);