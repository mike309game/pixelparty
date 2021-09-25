depth = -y
switch catmode
	{
		case 0:
			{
				if place_meeting(x,y,o_player) && keyboard_check_pressed(ord("Z")) && !instance_exists(o_text)
					{
						textbox("cat1","level1")
					}
				
				break;
			}
	}