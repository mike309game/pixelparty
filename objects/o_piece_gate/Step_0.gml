if point_in_circle(o_player.x+24,o_player.y+24,x+(sprite_width/2),y+(sprite_height/2),(sprite_width+sprite_height)) && global.player.puzzle >= want
	{
		fade = 1
		show_debug_message("A")
	}
	
if fade = 1
	{
		malpha -= 0.03
		
		if malpha < 0
			{
				global.gates.gate[gate_id] = 1
				//boxDestroy(boxi)
				instance_destroy(id)
			}
	}