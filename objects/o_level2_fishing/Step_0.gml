switch fade_mode
	{
		case 0:
			{
				fade += 0.01
				break;
			}
		case 1:
			{
				fade -= 0.01
				break;
			}
	}
switch game_mode
	{
		case 0: // fade in
			{
				if fade >= 1
					{
						game_mode = 1
						fade_mode = 1
					}
				break;
			}
		case 1: // ready start
			{
				
			}
	}
show_debug_message(fade)