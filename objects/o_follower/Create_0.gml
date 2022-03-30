position_list_x = ds_list_create()
position_list_y = ds_list_create()

for(var i = 0; i < 31; i++)
	{
		ds_list_insert(position_list_x,0,obj_player.x)
		ds_list_insert(position_list_y,0,obj_player.y)
	}

character = "tb"

sprite_index = asset_get_index("s_"+string(character)+"_down")

// character MUST be based off the sprite name for example: s_tb_up
// you would set the character var to "tb"

