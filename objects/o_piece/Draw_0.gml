if(!gotMe) {
	var rad = 1.2 * sin((global.time + x*50)/12) + 1.2;
	draw_set_alpha(image_alpha / 4);
	matrix_set(matrix_world, matrix_build(x-1,ystart+24,0,0,0,0,rad + 0.3, rad/2 + 0.3, 1));
	draw_rectangle_color(-2,-1,2,1,c_black,c_black,c_black,c_black,0);
	matrix_set(matrix_world, defaultMatrix);
	draw_set_alpha(1);
}
draw_self();