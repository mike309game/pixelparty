/// @desc collision check

if place_meeting(x,y,o_level2_race_obst)
	{
		o_level2_race.progress -= 5
		Sound(sx_bully_cry)
		
		// destroy the object that we specifically touched
		if object_exists(o_level2_race_obst)
			{
				for(var i = 0; i < instance_number(o_level2_race_obst); i++)
					{
						var obst = instance_find(o_level2_race_obst,i)
						if obst.place_meeting(x,y,o_level2_race_obst)
							{
								instance_destroy(obst)
							}
					}
			}
		o_level2_race.obst_hits++
	}


alarm_set(0,5)
