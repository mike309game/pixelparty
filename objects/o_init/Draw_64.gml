draw_text(0,120,"game fps: "+string(fps))
#region Room Transition
transalpha = clamp(transalpha,0,1)
if instance_exists(o_player) || global.vars.ignoreplayer
	{
		if room_get_name(global.vars.roomgo) !=  room_get_name(room)
			{
				transalpha = lerp(transalpha,1,.1)
				global.player.move = 0
				if instance_exists(o_player) then o_player.spd = 0.3
				if transalpha >= 0.99
					{
						room_goto(global.vars.roomgo)
						global.vars.ignoreplayer = 0
					}
			}

	}
if room_get_name(global.vars.roomgo) =  room_get_name(room)
			{
				transalpha = lerp(transalpha,0,.1)
			}
			


		switch global.vars.roomtr
			{
				case 0:
					{
						draw_sprite_ext(s_fade_white,0,0,0,1,1,0,c_white,transalpha)
						break;
					}
				case 1:
					{
						draw_sprite_ext(s_fade_black,0,0,0,1,1,0,c_white,transalpha)
						break;
					}
				default:
					{
						draw_sprite_ext(s_fade_white,0,0,0,1,1,0,c_white,transalpha)
						break;
					}
			}

#endregion