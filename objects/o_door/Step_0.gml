if keyboard_check_pressed(ord("Z")) && place_meeting(x,y,o_player) && (!instance_exists(o_text) && !instance_exists(o_pause))
	{
		if !load
			{
				roomTrans(rm,pt,0)
			}
		else
			{
				if LVDOOR
					{
						dotrans = 1
					} else {
					
						global.vars.fakeload = rm
						roomTrans(r_load,0,0)
					}
				
			}
	}
	
if dotrans
	{
		if al = 0
			{
				Sound(sx_level_enter,0)
				Music(sx_nothing,0)
			}
		al += 0.01
						
						if al >= 2
							{
								global.vars.fakeload = rm
								roomTrans(r_load,0,0)
							}
	}