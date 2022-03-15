surface_set_target(global.pausedsurface);
	draw_sprite_tiled(s_pause_bg,0,global.time/4,global.time/3);
	if(blackout) {
		draw_rectangle_colour(0,0,320,240,0,0,0,0,0);
	} else if(menuMode != 3) {
		DrawMenuSimple(menu, 16, 150);
		
		gpu_set_blendenable(false);
		
		shader_set(shUnprecise);
		var point = surfaceShow / 60;
		var xoff = EaseInOutCubic(0,lengthdir_x(2,global.time / 1),point);
		var yoff = EaseInOutCubic(0,lengthdir_y(2,global.time / 1),point);
		matrix_set(matrix_world, matrix_build(xoff,yoff,0,0,0,0,1,1,1));
		var scale = EaseInOutCubic(1,0.5,point);
		var xx = EaseInOutCubic(0,-8,point);
		var yy = EaseInOutCubic(0,26,point);
		var rot = EaseInOutCubic(0,10,point);
		draw_surface_ext(application_surface,
			xx-2,
			yy-1, scale+0.01, scale+0.01,
			rot, c_black, 1);
		draw_surface_ext(application_surface,
			xx,
			yy, scale, scale,
			rot, c_white, 1);
		
		gpu_set_blendenable(true);
		
		draw_sprite(s_pause_pause, 0, EaseInOutCubic(320,100,point),40);
		
		matrix_set(matrix_world, defaultMatrix);
		shader_reset();
	} else { //should only ever get here if choosing where to save
		fileSelectMenu.Draw(1);
	}
	
surface_reset_target();