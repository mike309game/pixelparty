if(floor(image_index) == 15 && image_speed == 1) {
	if(goesDown) {
		image_index = 16;
	}
	image_speed = 0;
	Transition(destination, marker, 0);
}