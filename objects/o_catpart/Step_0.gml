image_index = part

if place_meeting(x,y,o_player)
	{
		global.catparts.part[part] = 1
		Sound(sx_pause_move,0)
		instance_destroy(id)
	}
	
