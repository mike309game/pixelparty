// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/*function draw_set_gui() {
	gml_pragma("forceinline");
	surface_set_target(global.guisurface);
}

function draw_reset() {
	gml_pragma("forceinline");
	surface_reset_target();
}*/

#macro draw_gui_set surface_set_target(global.guisurface);
#macro draw_gui_exit surface_reset_target();