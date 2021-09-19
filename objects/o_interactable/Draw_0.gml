draw_self()
if instance_exists(o_player)
	{
		if place_meeting(x,y,o_player)
			{
				//depth = -999999
				draw_sprite(s_interact,0,o_player.x+8,o_player.y)
			}
	}