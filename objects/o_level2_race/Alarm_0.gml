/// @desc starting timer alarm

start_timer++

switch start_timer
	{
		case 10:
			{
				number_scale = 0.8
				Sound(sx_pause_move)
				break;
			}
		case 20:
			{
				number_scale = 0.8
				race_start_ani--
				Sound(sx_pause_move)
				break;
			}
		case 30:
			{
				number_scale = 0.8
				race_start_ani--
				Sound(sx_pause_move)
				break;
			}
		case 40:
			{
				number_scale = 0.8
				race_start_ani--
				Sound(sx_pause_move,2)
				break;
			}
	}
	
if start_timer >= 42
	{
		random_object_timer--
		
	}

if random_object_timer = 0 && obst_spawner
{
	instance_create_depth(342,128+irandom_range(1,32),-320,o_level2_race_obst)
	random_object_timer = irandom_range(10,25)
}

alarm_set(0,6)
