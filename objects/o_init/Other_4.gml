if room_get_name(global.vars.roomgo) =  room_get_name(room)
	{
		global.player.move = 1
		global.vars.ignoreplayer = 0
	}
level_sign_y = 240
level_sign_timer = 0
sign_do = true

if ds_map_find_value(global.gameevent,string_copy(room_get_name(room),3,2)+"_e0") then sign_do = 0