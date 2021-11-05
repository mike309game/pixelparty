

switch game_mode
	{
		case 0: // nothing
			{
				break
			}
		case 1: // ready start
			{
				draw_rectangle_color(0,0,320,240,c_white,c_white,c_white,c_white,0)
				for(var i = 0; i < 30; i++)
					{
						draw_sprite_part(s_l2_minigame,0,0,96,48,16,i*48-48+wateroffset,64)
					}
				draw_sprite_part_ext(s_l2_minigame,0,0,112,16,16,0,80,99,99,c_white,1)
			}
	}
	
	
draw_sprite_ext(s_fade_black,0,0,0,1,1,0,c_white,fade)