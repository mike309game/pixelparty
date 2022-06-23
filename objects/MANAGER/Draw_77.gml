var surfX = -160 * global.gameSurfaceScale;
var surfY = -120 * global.gameSurfaceScale;
display_set_gui_maximise(global.gameSurfaceScale,global.gameSurfaceScale,surfX + global.windowCenterX,surfY + global.windowCenterY); //draw gui

matrix_set(matrix_world, matrix_build(global.windowCenterX, global.windowCenterY, 0, 0, 0, 0, global.gameSurfaceScale, global.gameSurfaceScale, 1)); //set center of world

shader_set(sh_fader);
shader_set_uniform_f(fader_uni, GetGameFlag(eFlag.fadeBlack) ? -fadeValue : fadeValue);

gpu_set_blendenable(0); //fix blending shenanigans

//if pause menu draw the pause surface instead
draw_surface_ext(instance_exists(o_pause) ? global.pausedsurface : application_surface, -160, -120, 1, 1, 0, c_white, 1);

gpu_set_blendenable(1);

if(os_type == os_android) {
	for(var i = 0; i < array_length(touchInputInfo); i++) {
		var scale = touchInputInfo[i][3] ? 1.2 : 1;
		draw_sprite_ext(s_placeholderbt, i, (touchInputInfo[i][0] + 16) - 160, (touchInputInfo[i][1] + 16) - 120, scale, scale, 0, c_white, 0.5);
	}
}

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
/*TextAlignRight();
var infoString = "";
for(var i = 0; i < 64; i++) {
	infoString += "\n" + global.flagDefs[i] + ": " + string(global.flag & (1 << i) == 1 << i);
}
draw_set_colour(c_white);
draw_set_font(fntSmall);
draw_text(windowWidth,0,infoString);
TextAlignReset();*/
/*draw_set_font(fntSmall);
draw_text(0,0,"\n\n\nfadeValue " + string(fadeValue) + "\nfadeSpeed " + string(fadeSpeed));*/