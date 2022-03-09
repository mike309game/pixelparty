if(image_xscale < 0) {
	instance_destroy();
	exit;
}
image_angle += rotDir;
image_alpha -= 0.01;
image_xscale -= 0.01;
image_yscale = image_xscale;