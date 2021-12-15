if(irandom_range(0,10) == 2) {
	var randomDir = irandom_range(0,360);
	with(instance_create_depth(lengthdir_x(10,randomDir)+x,lengthdir_y(10,randomDir)+y,depth,obj_bigarrow)) {
		image_angle = randomDir - 180;
	}
}