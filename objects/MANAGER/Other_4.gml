/*
if room_get_name(global.vars.roomgo) =  room_get_name(room)
	{
		global.player.move = 1
		global.vars.ignoreplayer = 0
	}
*/
level_sign_y = 240
level_sign_timer = 0
sign_do = true


switch string_copy(room_get_name(room), 3, 2)
	{
		case "l1":
			{
				if !global.script_variables[? "level1-introSign"] then sign_do = true
				break;
			}
		case "l2":
			{
				if !global.script_variables[? "level2-introSign"] then sign_do = true
				break;
			}
		case "l3":
			{
				if !global.script_variables[? "level1-introSign"] then sign_do = true
				break;
			}
		default:
			{
				sign_do = false
				break;
			}
	}
//if ds_map_find_value(global.gameevent,string_copy(room_get_name(room),3,2)+"_e0") then sign_do = 0

gc_collect(); //collect tresh
//failsafe
global.camX = 0;
global.camY = 0;