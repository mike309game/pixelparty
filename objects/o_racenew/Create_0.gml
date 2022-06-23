EVTLIVE;
cam3d = camera_create();
//camera_set_proj_mat(cam3d, matrix_build_projection_perspective_fov(70, 4/3, 1, 16000));
//camera_set_view_mat(cam3d, matrix_build_lookat(0, 96, 60, 0, 0, 0, 0, 0, 1));
dirmdl = LoadModel("mesh/dirtest.bin");
mdl = LoadModel("mesh/race/terraintest.bin");
vertex_freeze(mdl);


//Player data
playerSprite = Sprite3D(s_manny_up);
playerX = 0;
playerY = 0;
playerZ = 0;












treeSprite = Sprite3D(s_l2_tree_big);


//debug
z = 0;
yaw = 0;
pitch = 0;
menu = new Menu();