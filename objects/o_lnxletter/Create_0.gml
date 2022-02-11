x -= 16;
hspeed = 1;
friction = 0.03;
image_alpha = 0;
image_index = instance_number(object_index)-1;
if(image_index < 4) {
	alarm[0] = 10;
} else {
	alarm[1] = 60*4;
}
waitingForFade = false;