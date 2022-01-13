///@description check gui surface existence
if(!surface_exists(global.guisurface)) {
	global.guisurface = surface_create(320,240);
} else {
	draw_gui_set;
	draw_clear_alpha(0,0);
	draw_gui_exit;
}

if(!surface_exists(global.pausedsurface)) {
	global.pausedsurface = surface_create(320,240);
} else {
	surface_set_target(global.pausedsurface);
	draw_clear_alpha(0,0);
	surface_reset_target();
}