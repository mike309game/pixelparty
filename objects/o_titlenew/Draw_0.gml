//draw solid bg
draw_clear(backgroundColour);

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
//gpu_set_cullmode(cull_noculling);

//draw the scrolling floors

//enable texture repeating
gpu_set_tex_repeat(true);

//set fog to blue
gpu_set_fog(true, backgroundColour, 1, 256);

var blueFloorTex = sprite_get_texture(s_title_bg_0, 0); //blue bg
var redFloorTex = sprite_get_texture(s_title_bg_1, 0); //red bg

gpu_set_ztestenable(true); //just for the floors

//blue

//draw the bottom floor
Draw3dFloors(bluePlanesZ, blueFloorTex);
//draw the top floor
Draw3dFloors(-bluePlanesZ, blueFloorTex);

//red

//draw the bottom floor
Draw3dFloors(redPlanesZ, redFloorTex);
//draw the top floor
Draw3dFloors(-redPlanesZ, redFloorTex);

gpu_set_ztestenable(false);

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
mtxpush(matrix_build(uiX,uiY,uiZ,uiXRot,uiYRot,uiZRot,1,1,1));

if(state > 1) { //if 2 or above, show start prompt
	DrawSpriteNoCullingExt(s_title_start, 0, 160, startY, startScale, startScale, 0, c_white, startAlpha);
}

//draw choices

DrawSpriteNoCullingExt(s_title_files, 0, 59, choicersY, 1, 1, 0, c_white, 1);
DrawSpriteNoCullingExt(s_title_files, 1, 160, choicersY, 1, 1, 0, c_white, 1);
DrawSpriteNoCullingExt(s_title_files, 2, 260, choicersY, 1, 1, 0, c_white, 1);

//push pxpa logo floatiness
mtxpush(matrix_build(sin(global.time / 100) * 4, sin(global.time / 110) * 4, 0, 0, 0, 0, 1, 1, 1));

//set matrix to top
mtxset();

DrawPxpaLogo(pxpaX + 4,pxpaY + 4,pxpaZ,c_black,0);
DrawPxpaLogo(pxpaX,pxpaY,pxpaZ,c_white,0);

//pop pxpa floatiness
mtxpop();

//pop ui matrix
mtxpop();

//set back to default top

mtxset();

shader_reset();

camera_apply(camNormal);
//gpu_set_ztestenable(false);