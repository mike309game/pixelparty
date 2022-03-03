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

//restore camera for ui
camera_apply(camNormal);

//shader_set(shUnprecise);

if(state > 1) { //if 2 or above, show start prompt
	draw_sprite_ext(s_title_start, 0, 164, startY, startScale, startScale, 0, c_white, startAlpha);
}

if(state == 5) { //choosing state
	draw_sprite_ext(s_hand_big, 0, 59 + ((160-59) * choicerChoice), 200, 1, 1, 0, c_white, 1);
	//draw what choice it is
	draw_set_font(f_jaxfont);
	TextAlignCenter();
	var choiceName = "Die";
	switch(choicerChoice) {
		case 0:
			choiceName = "New Game";
			break;
		case 1:
			choiceName = "Load Game";
			break;
		case 2:
			choiceName = "Options";
			break;
	}
	draw_set_colour(c_black);
	draw_text(160+1,88+1,choiceName);
	draw_set_colour(c_white);
	draw_text(160,88,choiceName);
	TextAlignReset();
}
if(state == 9) { //options state
	DrawMenuSimple(optionsMenu, 55,120);
}

//push pxpa logo floatiness
mtxpush(matrix_build(sin(global.time / 100) * 4, sin(global.time / 110) * 4, 0, 0, 0, 0, 1, 1, 1));

//set matrix to top
mtxset();

DrawPxpaLogo(pxpaX + 4,pxpaY + 4,$101010,0);
DrawPxpaLogo(pxpaX,pxpaY,c_white,0);

//pop pxpa floatiness
mtxpop();

//draw choices in 3d space

//enable 3d camera again
camera_apply(cam3d);

//enable this so the current choice selected overlaps everything else
gpu_set_ztestenable(true);

//this is needed because dumb gamemaker alpha blending
gpu_set_alphatestenable(true);

//push floating ui matrix
mtxpush(matrix_build(uiX,uiY,uiZ,uiXRot,uiYRot,uiZRot,1,1,1));

//set the matrix
mtxset();

//draw the stuff

if(state < 7) {
	for(var i = 0; i < 3; i++) {
		DrawSpriteNoCullingExt(s_title_files, i, (59 + ((160-59) * i)) + choicerX[i], choicerY[i] + choicerSelectedProgress[i] / -1.2, 1, 1, 0, merge_colour(c_white,c_black,choicerSelectedProgress[i] / 45), mouse_x / 240, choicerZ[i]);
		//DrawSpriteNoCullingExt(s_title_files, 1, 160, choicer2Y, 1, 1, 0, c_white, 1);
		//DrawSpriteNoCullingExt(s_title_files, 2, 260, choicer3Y, 1, 1, 0, c_white, 1);
	}
}

//pop floating	ui matrix
mtxpop();

//set back to default top
mtxset();

//shader_reset();

camera_apply(camNormal);
gpu_set_ztestenable(false);
gpu_set_alphatestenable(false);