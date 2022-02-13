var windowWidth, windowHeight;
if(os_browser == browser_not_a_browser) {
	windowWidth = window_get_width();
	windowHeight = window_get_height();
} else {
	windowWidth = browser_width;
	windowHeight = browser_height;
}

var windowCenterX = windowWidth >> 1;
var windowCenterY = windowHeight >> 1;

var scaled = floor(min(windowWidth / 320, windowHeight / 240));
var surfX = -160 * scaled;
var surfY = -120 * scaled;
display_set_gui_maximise(scaled,scaled,surfX + windowCenterX,surfY + windowCenterY); //draw gui

matrix_set(matrix_world, matrix_build(windowCenterX, windowCenterY, 0, 0, 0, 0, 1, 1, 1)); //set center of world
shader_set(sh_fader);
shader_set_uniform_f(fader_uni, GetGameFlag(eFlag.fadeBlack) ? -fadeValue : fadeValue);

gpu_set_blendenable(0);
if(instance_exists(o_pause)) {
	draw_surface_ext(global.pausedsurface, surfX, surfY, scaled, scaled, 0, c_white, 1);
} else {
	draw_surface_ext(application_surface, surfX, surfY, scaled, scaled, 0, c_white, 1);
}
gpu_set_blendenable(1);

/*gpu_set_blendmode(bm_subtract);
draw_sprite_ext(ovly,0,surfX,surfY,scaled,scaled,0,c_white,1);
gpu_set_blendmode(bm_normal);*/
shader_reset();

matrix_set(matrix_world, matrix_build_identity());
//draw object info
//this somewhat cripples performance
/*var infoString = "\n\n";
with(all) {
	if(object_index == o_hitbox) then continue;
	infoString +=
	"Object: " + object_get_name(object_index) + "\n";
	for(var i = 0; i < 12; i++) {
		if(alarm[i] != -1) {
			infoString += "alarm[" + string(i) + "]=" + string(alarm[i]) + "\n";
		}
	}
	infoString += "----------------\n";
}
draw_set_colour(c_white);
draw_set_font(fntSmall);
draw_text(0,0,infoString);*/