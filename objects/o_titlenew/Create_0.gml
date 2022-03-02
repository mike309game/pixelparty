//blue 55B2FF rgb FFB255 bgr
//redpink ff55a7 rgb a755ff bgr
backgroundColour = 0xFFB255;

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

//canProgress = false;
acceptInput = true;
alarm[0] = 120;

/*

0: just started
1: show pxpa logo
2: show start prompt
3: blinking start prompt
4: on choicers screen, hide press start below

*/
state = 0;

bluePlanesZ = 80;
redPlanesZ = 1000;

//backgroundAlpha = 0;
//increaseChoicersProgress = false;
choicersProgress = 0; //0 - 100 progress for showing choicers and positioning pxpa logo ontop of ui
choicersY = 1500;

pxpaScale = 0;
pxpaScaleProgress = 0; //0 - 60
//pxpaScaleCanProgress = false;
pxpaX = 160;
pxpaY = 120;
pxpaZ = -20;

pxpaLetterSize = array_create(10,1);
pxpaLetterResizeCooldown = array_create(10,1);
pxpaLetterResizerCurrent = 0;

startAlpha = 1;
startScale = 1;
startY = 200;

camNormal = view_camera[0];
cam3d = camera_create();
camera_set_proj_mat(cam3d, matrix_build_projection_perspective_fov(90,4/3,1,16000));

Draw3dFloors = function(z, tex) {
	if(abs(z) > 220) exit; //idk
	var addition2 = global.time / 600;
	var addition1 = global.time / 300;
	mtxpush(matrix_build(0,0,z,0,0,0,1,1,1));
	mtxset();
	//draw_primitive_begin_texture(pr_trianglefan, sprite_get_texture(s_title_bg_0,0));
	draw_primitive_begin_texture(pr_trianglefan, tex);
	draw_vertex_texture(-512,-512,1*20 + addition1,1*20 + addition2);
	draw_vertex_texture(512,-512,0 + addition1,1*20 + addition2);
	draw_vertex_texture(512,512,0 + addition1,0 + addition2);
	draw_vertex_texture(-512,512,1*20 + addition1,0 + addition2);
	draw_primitive_end();
	mtxpop();
	mtxset();
}

DrawPxpaLogo = function(x,y,z,colour,angle) {
	//push the pixel party letter matrix
	mtxpush(matrix_build(x,y,z,0,0,angle,pxpaScale,pxpaScale,1));
	
	//set matrix to top (pxpa letter mtx)
	mtxset();
	
	DrawSpriteNoCullingExt(s_titleletter, 0, 125-160, 109-120, pxpaLetterSize[0], pxpaLetterSize[0], 0, colour, 1); //p
	DrawSpriteNoCullingExt(s_titleletter, 1, 143-160, 109-120, pxpaLetterSize[1], pxpaLetterSize[1], 0, colour, 1); //i
	DrawSpriteNoCullingExt(s_titleletter, 2, 160-160, 109-120, pxpaLetterSize[2], pxpaLetterSize[2], 0, colour, 1); //x
	DrawSpriteNoCullingExt(s_titleletter, 3, 176-160, 109-120, pxpaLetterSize[3], pxpaLetterSize[3], 0, colour, 1); //e
	DrawSpriteNoCullingExt(s_titleletter, 4, 194-160, 109-120, pxpaLetterSize[4], pxpaLetterSize[4], 0, colour, 1); //l
	
	DrawSpriteNoCullingExt(s_titleletter, 5, 102-160, 152-120, pxpaLetterSize[5], pxpaLetterSize[5], 0, colour, 1); //p
	DrawSpriteNoCullingExt(s_titleletter, 6, 131-160, 152-120, pxpaLetterSize[6], pxpaLetterSize[6], 0, colour, 1); //a
	DrawSpriteNoCullingExt(s_titleletter, 7, 160-160, 152-120, pxpaLetterSize[7], pxpaLetterSize[7], 0, colour, 1); //r
	DrawSpriteNoCullingExt(s_titleletter, 8, 189-160, 152-120, pxpaLetterSize[8], pxpaLetterSize[8], 0, colour, 1); //t
	DrawSpriteNoCullingExt(s_titleletter, 9, 218-160, 152-120, pxpaLetterSize[9], pxpaLetterSize[9], 0, colour, 1); //y
	
	//pop pxpa letter matrix
	mtxpop();
	
	//restore matrix
	mtxset();
}