if(!instance_exists(obj_player)) {
	instance_destroy();
}


if((point_distance(x+24,y+24,obj_player.x,obj_player.y) < 90 || broken) && enabled) {
	//image_index = lerp(image_index, 36, 0.15);
	openAmt++;
	breakCounter++;
} else if(!broken || !enabled) {
	//image_index = lerp(image_index, 0, 0.15);
	openAmt--;
	breakCounter++;
}
openAmt = clamp(openAmt, 0, 35);

image_index = EaseInOutCubic(0,35,openAmt / 35);

if(floor(image_index) == 0 || ceil(image_index) == 35) {
	breakCounter = 0;
}
if(breakCounter == 130 && !broken) {
	broken = true;
	shakeAmt = 5;
}

SetDepth();

x = xstart + ((global.time % 2) == 0 ? shakeAmt : -shakeAmt);
shakeAmt /= 1.2;//max(shakeAmt - 1, 0);