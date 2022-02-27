//draw bg

//draw_sprite_tiled_ext(s_title_bg_0, 0, global.time / 6, global.time / 4, 1, 1, c_white, backgroundAlpha);

//set 3d projection pos
if(debugPlacer) {
	camera_set_view_mat(cam3d, matrix_build_lookat(0,-120/2,-70,0,0,0,0,0,1));
} else {
	camera_set_view_mat(cam3d, matrix_build_lookat(0,0,0,0,1,0,0,0,1));
}

//use the 3d projection
camera_apply(cam3d);
gpu_set_cullmode(cull_noculling);
//gpu_set_ztestenable(true);

//draw the scrolling floors

//enable texture repeating
gpu_set_tex_repeat(true);

//set fog to blue
gpu_set_fog(true, $FFB255, 1, 256);

//draw the bottom floor
Draw3dFloors(80);
//draw the top floor
Draw3dFloors(-80);

//draw camera spot thing
draw_primitive_begin_texture(pr_trianglefan, sprite_get_texture(lorem,0));
draw_vertex_texture(-10.5,-10.5,0,0);
draw_vertex_texture(10.5,-10.5,1,0);
draw_vertex_texture(10.5,10.5,1,1);
draw_vertex_texture(-10.5,10.5,0,1);
draw_primitive_end();

//disable the fog for the ui
gpu_set_fog(false, c_white, 1, 1);

//camera_apply(camNormal);

//shader_set(shUnprecise);

//push floating ui matrix
matrix_stack_push(matrix_build(uiX,uiY,uiZ,uiXRot,uiYRot,uiZRot,1,1,1));

//push the pixel party letter matrix
matrix_stack_push(matrix_build(160,120,0,0,0,mouse_x,pxpaScale,pxpaScale,1));

//set matrix to top (pxpa letter mtx)
matrix_set(matrix_world, matrix_stack_top());

DrawSpriteNoCullingExt(s_titleletter, 0, 125-160, 109-120, pxpaLetterSize[0], pxpaLetterSize[0], 0, c_white, 1); //p
DrawSpriteNoCullingExt(s_titleletter, 1, 143-160, 109-120, pxpaLetterSize[1], pxpaLetterSize[1], 0, c_white, 1); //i
DrawSpriteNoCullingExt(s_titleletter, 2, 160-160, 109-120, pxpaLetterSize[2], pxpaLetterSize[2], 0, c_white, 1); //x
DrawSpriteNoCullingExt(s_titleletter, 3, 176-160, 109-120, pxpaLetterSize[3], pxpaLetterSize[3], 0, c_white, 1); //e
DrawSpriteNoCullingExt(s_titleletter, 4, 194-160, 109-120, pxpaLetterSize[4], pxpaLetterSize[4], 0, c_white, 1); //l

DrawSpriteNoCullingExt(s_titleletter, 5, 102-160, 152-120, pxpaLetterSize[5], pxpaLetterSize[5], 0, c_white, 1); //p
DrawSpriteNoCullingExt(s_titleletter, 6, 131-160, 152-120, pxpaLetterSize[6], pxpaLetterSize[6], 0, c_white, 1); //a
DrawSpriteNoCullingExt(s_titleletter, 7, 160-160, 152-120, pxpaLetterSize[7], pxpaLetterSize[7], 0, c_white, 1); //r
DrawSpriteNoCullingExt(s_titleletter, 8, 189-160, 152-120, pxpaLetterSize[8], pxpaLetterSize[8], 0, c_white, 1); //t
DrawSpriteNoCullingExt(s_titleletter, 9, 218-160, 152-120, pxpaLetterSize[9], pxpaLetterSize[9], 0, c_white, 1); //y

//pop pxpa letter matrix
matrix_stack_pop();

//pop ui matrix
matrix_stack_pop();

//set back to default top

//matrix_set(matrix_world, matrix_stack_top());

shader_reset();

camera_apply(camNormal);
gpu_set_ztestenable(false);