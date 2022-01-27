with(instance_create_depth(x,y,0,obj_lettermakerletter)) {
	direction = other.counter * 25 + 45;
	speed = 2;
	friction = 0.04;
	image_index = other.counter;
}
if(counter++ < 9) {
	alarm[0] = 10;
}