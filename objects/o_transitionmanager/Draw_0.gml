if(room == r_interval) { //draw loading screen shit
	var quickLoadSprite = s_pxpa_quickload;
	if(!GetGameFlag(eFlag.fadeBlack)) {
		draw_set_colour(c_white);
		draw_rectangle(0,0,320,240,0);
		quickLoadSprite = s_pxpa_quickload_dark;
	}
	if(loadingScreen) {
		draw_sprite_tiled_ext(s_cloud_loop, 0, floor(global.time / 60), 0, 1, 1, $19090A,1);
		shader_set(shUnprecise);
		for(var i = 0; i < 7; i++) {
			draw_sprite_ext(s_loadingnew, i, 80 + (25 * i), 64,cos(global.time/20 + i) * 0.3 + 1, sin(global.time/25 + i) * 0.3 + 1, 0, c_white, 1);
		}
		shader_reset();		
	} else {
		draw_sprite(quickLoadSprite, global.time / 10, 320, 240);
	}
}