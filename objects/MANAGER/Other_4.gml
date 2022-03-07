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
//failsafe
global.camX = 0;
global.camY = 0;