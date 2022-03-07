var windowWidth = window_get_width();
var windowHeight = window_get_height();
var windowCenterX = windowWidth >> 1;
var windowCenterY = windowHeight >> 1;

var scaled = floor(min(windowWidth / 320, windowHeight / 240)); //get biggest possible integer scale
var surfX = -160 * scaled;
var surfY = -120 * scaled;
display_set_gui_maximise(scaled,scaled,surfX + windowCenterX,surfY + windowCenterY); //draw gui

matrix_set(matrix_world, matrix_build(windowCenterX, windowCenterY, 0, 0, 0, 0, 1, 1, 1)); //set center of world

shader_set(sh_fader);
shader_set_uniform_f(fader_uni, GetGameFlag(eFlag.fadeBlack) ? -fadeValue : fadeValue);

gpu_set_blendenable(0); //fix blending shenanigans

//if pause menu draw the pause surface instead
draw_surface_ext(instance_exists(o_pause) ? global.pausedsurface : application_surface, surfX, surfY, scaled, scaled, 0, c_white, 1);

gpu_set_blendenable(1);

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

//draw flag info
var infoString = "\n\n";
for(var i = 0; i < 64; i++) {
	infoString += "\n" + global.flagDefs[i] + ": " + string(global.flag & (1 << i) == 1 << i);
}
draw_set_colour(c_white);
draw_set_font(fntSmall);
draw_text(0,0,infoString);