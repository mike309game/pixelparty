EVTLIVE;
cam3d = camera_create();
//camera_set_proj_mat(cam3d, matrix_build_projection_perspective_fov(70, 4/3, 1, 16000));
//camera_set_view_mat(cam3d, matrix_build_lookat(0, 96, 60, 0, 0, 0, 0, 0, 1));
//dirmdl = LoadModel("mesh/dirtest.bin");
mdl = LoadModel("mesh/race/terraintestnew.bin");
vertex_freeze(mdl);

Line = function(x1, y1, x2, y2, callback) constructor {
	self.x1 = x1;
	self.y1 = y1;
	self.x2 = x2;
	self.y2 = y2;
	//self.callback = callback;
}

CheckColl = function(x1, y1, x2, y2) { //doesn't work properly if lines have an equal point Oh Well!!!!!!!!! Donot care
	ds_stack_push(checkStack, new Line(x1,y1,x2,y2));
	var len = ds_list_size(objects);
	for(var i = 0; i < len; i++) {
		var object = objects[|i];
		var line = object.myLine;
		var dx0 = line.x2-line.x1;
		var dx1 = x2-x1;
		var dy0 = line.y2-line.y1;
		var dy1 = y2-y1;
		var p0 = dy1*(x2-line.x1) - dx1*(y2-line.y1);
		var p1 = dy1*(x2-line.x2) - dx1*(y2-line.y2);
		var p2 = dy0*(line.x2-x1) - dx0*(line.y2-y1);
		var p3 = dy0*(line.x2-x2) - dx0*(line.y2-y2);
		if((p0*p1<0) && (p2*p3<0)){
			return object;
		}
	}
	return noone;
}

checkStack = ds_stack_create();

playfieldWidth = 139.5; //i love space ants

//Camera data
camFocusX = 0;
camFocusY = 0;
camFocusZ = 0;
camFocusRaceProgress = 0;


objects = ds_list_create();



playerRacer = new raceobjRacer(Sprite3D(s_raceMannyIdleFront));
playerRacer.isPlayer = true;
raceFocus = 0;

ds_list_add(objects, playerRacer);
ds_list_add(objects, new raceobjRacer(Sprite3D(s_tb)));

var lineTester = new raceobjTestline();
ds_list_add(objects, lineTester);












treeSprite = Sprite3D(s_l2_tree_big);


//debug
z = 0;
yaw = 0;
pitch = 0;
menu = new Menu();

depth = -16000; //this is really only done for the post draw debug coll THIS FUCKS UP THE UI MACRO THOUGH so draw ui elements at the End of the draw event cuz 3d cam is disabled there