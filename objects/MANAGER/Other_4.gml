level_sign_y = 240
level_sign_timer = 0
sign_do = 0


switch(string_copy(room_get_name(room), 3, 2)) {
	case "l1":
		if !global.script_variables[? "level1-introSign"] then sign_do = true; global.script_variables[? "level1-introSign"] = true;
		break;
	case "l2":
		if !global.script_variables[? "level2-introSign"] then sign_do = true; global.script_variables[? "level2-introSign"] = true;
		break;
	case "l3":
		if !global.script_variables[? "level3-introSign"] then sign_do = true; global.script_variables[? "level3-introSign"] = true;
		break;
	default:
		sign_do = false
		break;
}

gc_collect(); //collect tresh

//setup views

view_enabled = true; //why the fuck would we ever disable it

//show_debug_message("the main camera index is " + string(global.mainCamera));
for(var i = 0; i < 8; i++) { //cleanup default room cameras
	//show_debug_message(string(room_get_name(room)) + " camera " + string(i) + " destroyed and it held camera index " + string(view_camera[i]));
	camera_destroy(view_camera[i]);
}
view_camera[0] = global.mainCamera; //set the camera we use
view_visible[0] = true;

//failsafe
global.camX = 0;
global.camY = 0;
CamApply();