///@description check paused surface existence

if(!surface_exists(global.pausedsurface)) {
	global.pausedsurface = surface_create(320,240);
} else {
	surface_set_target(global.pausedsurface);
	draw_clear_alpha(0,0);
	surface_reset_target();
}