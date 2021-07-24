if keyboard_check_pressed(ord("Z")) && place_meeting(x,y,o_player)
	{
		if !load
			{
				roomTrans(rm,pt,0)
			}
		else
			{
				global.vars.fakeload = r_l1_r1
				roomTrans(r_load,0,0)
			}
	}