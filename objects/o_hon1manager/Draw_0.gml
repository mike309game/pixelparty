draw_sprite_tiled_ext(s_cloud_loop, 0, global.time/8, global.time/4, 1, 1, #2E0533, backgroundAlpha);

//draw manny

var xx = 160 + global.camX;
var yy = 120 + global.camY + mannyY + mannyYSin;
var scale = 1 + mannyScale;
var subimg = global.time / 20;

//draw manny's normal sprite
draw_sprite_ext(s_manny_intro, subimg, xx, yy, scale, scale, 0, c_white, mannyAlpha);

//draw white manny
gpu_set_fog(true, c_white, 0, 1);
draw_sprite_ext(s_manny_intro, subimg, xx, yy, scale, scale, 0, c_white, mannyWhiteAlpha);
gpu_set_fog(false, c_white, 0, 1); //disable the white manny's fog
