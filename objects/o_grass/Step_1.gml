if place_meeting(x,y,obj_player)
	{
		if !playedSound
			{
				Sound(sx_walk_grass,random_range(0.8,1.1),0.5)
			}
		image_index = 1
		playedSound = true
	} else {
		image_index = 0
		playedSound = false
	}
	
SetDepth();
