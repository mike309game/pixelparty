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

/*globalvar priorityMatrix;
priorityMatrix = ;*/
globalvar defaultMatrix;
defaultMatrix = matrix_build_identity();

#macro draw_gui_set surface_set_target(global.guisurface);
//#macro draw_gui_set matrix_set(matrix_world,matrix_build(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),-16000,0,0,0,1,1,1));
#macro draw_gui_exit surface_reset_target();
//#macro draw_gui_exit matrix_set(matrix_world,defaultMatrix);

global.guiInstancesStack = ds_stack_create();
global.drawingGui = false;

#macro ifGui if not global.drawingGui and view_current == 0 then ds_stack_push(global.guiInstancesStack, id) else {
#macro endGui exit;}