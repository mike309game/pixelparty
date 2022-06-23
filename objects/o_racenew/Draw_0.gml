EVTLIVE;

/*var multiplier = 0.5;
var xItem = new MenuItem("X",true,x,-128,128, multiplier);
var yItem = new MenuItem("Y",true,y,-128,128, multiplier);
var zItem = new MenuItem("Z",true,z,-128,128, multiplier);
var yawItem = new MenuItem("Yaw",true,yaw,-360,360, multiplier);
var pitchItem = new MenuItem("Pitch",true,pitch,-90,90, multiplier);

var returnVal = menu.ProcessOptions(
	xItem,
	yItem,
	zItem,
	yawItem,
	pitchItem
);

x = xItem.sliderValue;
y = yItem.sliderValue;
z = zItem.sliderValue;
yaw = yawItem.sliderValue;
pitch = pitchItem.sliderValue;*/

camera_set_proj_mat(cam3d, matrix_build_projection_perspective_fov(70, 4/3, 1, 16000));
var lookat = matrix_build_lookat(0, 160, -90, playerX / 8, 0, -17, 0, 0, 1);
camera_set_view_mat(cam3d, lookat);
//camera_set_view_mat(cam3d, MatrixViewYawPitch(x, y, z, yaw, pitch))
gpu_set_ztestenable(true);
gpu_set_alphatestenable(true);
gpu_set_fog(true, $052f0c, 200, 800);
camera_apply(cam3d);

mtxpush(matrix_build(0,0,0,0,0,0,1,1,-1)); //make the z sane
mtxset(); //set top

//draw the normal terrain

//vertex_submit(mdl, pr_trianglelist, -1);

var terrainTex = sprite_get_texture(s_racenew_terrain, 0);

for(var i = -30; i < 4; i++) {
	mtxpush(matrix_build(0,(32*i) + round(global.time / 0.2) % 64,0,0,0,0,1,1,1)); //offset for all of this
	mtxset(); //set top
	draw_primitive_begin(pr_trianglefan);
	draw_vertex_color(-140, 0, c_teal, 1);
	draw_vertex_color(140, 0, c_teal, 1);
	draw_vertex_color(140, 32, c_teal, 1);
	draw_vertex_color(-140, 32, c_teal, 1);
	draw_primitive_end();
	vertex_submit(mdl, pr_trianglelist, terrainTex);
	if(abs(i) % 2) {
		DrawSprite3D(treeSprite, 0, -160, 0, 20, 0, 1, 1);
		DrawSprite3D(treeSprite, 0, 180, 0, 20, 0, 1, 1);
	}
	mtxpop(); //pop offset
}

/*draw_primitive_begin(pr_trianglefan);
draw_vertex_color(0, 0, c_teal, 1);
draw_vertex_color(16, 0, c_teal, 1);
draw_vertex_color(16, 16, c_teal, 1);
draw_vertex_color(0, 16, c_teal, 1);
draw_primitive_end();*/

DrawSprite3D(playerSprite, global.time / 10, -8 + playerX, 64, 16, 0, 1, 1);

mtxpop(); //pop sane z
mtxset(); //set matrix

camera_apply(view_camera[0]);
gpu_set_ztestenable(false);
gpu_set_alphatestenable(false);
gpu_set_fog(false, c_green, 100, 500);
//DrawMenuSimple(menu, 20, 0);