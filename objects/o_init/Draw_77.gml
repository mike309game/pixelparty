var windowWidth = window_get_width();
var windowHeight = window_get_height();

matrix_set(matrix_world, matrix_build(windowWidth >> 1, windowHeight >> 1, 0, 0, 0, 0, 1, 1, 1));

var scaled = min(floor(windowWidth / 320), floor(windowHeight / 240));
var surfX = -160 * scaled;
var surfY = -120 * scaled;

shader_set(sh_fader);
shader_set_uniform_f(fader_uni, global.vars.roomtr == 0 ? transalpha : -transalpha);
gpu_set_blendenable(0);
draw_surface_ext(application_surface, surfX, surfY, scaled, scaled, 0, c_white, 1);
gpu_set_blendenable(1);
draw_surface_ext(global.guisurface, surfX, surfY, scaled, scaled, 0, c_white, 1);
if(instance_exists(o_pause)) {
	gpu_set_blendenable(0);
	draw_surface_ext(global.pausedsurface, surfX, surfY, scaled, scaled, 0, c_white, 1);
	gpu_set_blendenable(1);
}
shader_reset();

matrix_set(matrix_world, matrix_build_identity());