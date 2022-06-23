//gamemaker is really fucking stupid dealing with draw gui so i gotta do this
//var u = shader_get_uniform(sh_wave, "timer");
//shader_set(sh_wave);
//shader_set_uniform_f(u,global.time/16);
//draw_sprite(spr_fullscreen,0,0,0);
//shader_reset();
//matrix_set(matrix_world, prioritymatrix);
//imgui_render();
//matrix_set(matrix_world, defaultmatrix);

//var len = ds_list_size(roomList);

/*draw_set_alpha(0.5);
draw_rectangle_colour(0,roomChosen*15-8,320,roomChosen*15+8,c_navy,c_navy,c_navy,c_navy,false);
draw_set_alpha(1);*/

if(menuShown) {
	draw_set_alpha(bgFade);
	//draw_rectangle_color(0,0,320,240,c_silver,c_silver,c_silver,c_silver,0); //bad idea i think
	draw_set_alpha(1);
	tapDebug.DrawCommands(tapDebugListCurrent);
}

//old code
/*if(choosingRoom) {
	draw_set_alpha(bgFade);
	draw_rectangle_color(0,0,320,240,c_silver,c_silver,c_silver,c_silver,0);
	draw_set_alpha(1);
	var spacing = -smoothSpacing;
	
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	
	for(var i = 0; i < roomCount; i++) {
		if(roomChosen == i) {
			draw_set_colour(c_navy);
		}
		draw_text(160,120 + spacing,roomList[|i]);
		draw_set_colour(c_white);
		spacing += 15;
	}
	
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
}*/