debugPlacer = false;
debugChangingWhat = 0;
debugChangingVariable = "uiX";
debugChangingRate = 8;

uiX = 160;
uiY = 120;
uiZ = -120;
uiXRot = 270;
uiYRot = 0;
uiZRot = 180;

canProgress = false;
alarm[0] = 120;

backgroundAlpha = 0;

pxpaScale = 0;
pxpaScaleProgress = 0; //0 - 60
pxpaScaleCanProgress = false;
pxpaX = 160;
pxpaY = 120;

pxpaLetterSize = array_create(10,1);
pxpaLetterResizeCooldown = array_create(10,1);
pxpaLetterResizerCurrent = 0;

camNormal = view_camera[0];
cam3d = camera_create();
camera_set_proj_mat(cam3d, matrix_build_projection_perspective_fov(90,4/3,1,16000));

Draw3dFloors = function(z) {
	var addition2 = global.time / 600;
	var addition1 = global.time / 300;
	matrix_stack_push(matrix_build(0,0,z,0,0,0,1,1,1));
	matrix_set(matrix_world, matrix_stack_top());
	draw_primitive_begin_texture(pr_trianglefan, sprite_get_texture(s_title_bg_0,0));
	draw_vertex_texture(-512,-512,1*20 + addition1,1*20 + addition2);
	draw_vertex_texture(512,-512,0 + addition1,1*20 + addition2);
	draw_vertex_texture(512,512,0 + addition1,0 + addition2);
	draw_vertex_texture(-512,512,1*20 + addition1,0 + addition2);
	draw_primitive_end();
	matrix_stack_pop();
	matrix_set(matrix_world, matrix_stack_top());
}