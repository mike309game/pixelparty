if special[0] && ds_map_find_value(global.gameevent,"de_e1") then find = "test2"

// check id
if keyboard_check_pressed(ord("C")) && global.debug.debug_enabled
	{
		if place_meeting(x,y,o_player)
			{
				show_debug_message(id)
			}
	}