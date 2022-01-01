#region level background handler

var room_nme = string_copy(room_get_name(room),3,2)

switch room_nme
	{
		case "ho":
			{
				draw_sprite_tiled(s_ho_bg,0,bgX+math,bgY+math)
				bgX-=0.3
				bgY+=0.6
				break;
			}
		case "l1":
			{
				
				bgX+=0.3
				bgY+=0.3
				if room = r_l1_r8 || room = r_l1_r4_apt || room = r_l1_house1
					{
						draw_sprite_tiled(s_er_bg,0,bgX+math,bgY+math)
						//bgX+=random_range(-10,10)
						//bgY+=random_range(-10,10)
					} else {
						draw_sprite_tiled(s_l1_bg,0,bgX+math,bgY+math)
					}
				break;
			}
		case "l2":
			{
				draw_sprite_tiled(s_l2_bg,0,bgX+math,bgY+math)
				bgX-=0.1
				bgY-=0.3
				break;
			}
		case "l3":
			{
				draw_sprite_tiled(s_l3_bg,0,bgX+math,bgY+math)
				bgX-=0.4
				bgY-=0.1
				break;
			}
		case "de":
			{
				draw_sprite_tiled(s_de_bg,0,bgX+math,bgY+math)
				bgX+= random_range(-2,2)
				bgY+= random_range(-2,2)
				break;
			}
	}

#endregion