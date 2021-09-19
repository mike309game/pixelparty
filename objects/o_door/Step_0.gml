if keyboard_check_pressed(ord("Z")) && place_meeting(x,y,o_player) && (!instance_exists(o_text) && !instance_exists(o_pause))
	{
		if !load
			{
				roomTrans(rm,pt,0)
			}
		else
			{
				global.vars.fakeload = rm
				roomTrans(r_load,0,0)
			}
	}