surface_set_target(global.pausedsurface);
	gpu_set_blendenable(false);
	draw_surface(application_surface, 0, 0);
	gpu_set_blendenable(true);
	DrawMenuSimple(menu, 16, 0);
surface_reset_target();