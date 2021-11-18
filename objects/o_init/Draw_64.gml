
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
						
						if transalpha > 0.8
							{
								draw_sprite(s_pxpa_quickload_dark,round(animate),320,240-48)
							}
						
						break;
					}
				case 1:
					{
						draw_sprite_ext(s_fade_black,0,0,0,1,1,0,c_white,transalpha)
						
						if transalpha > 0.8
							{
								draw_sprite(s_pxpa_quickload,round(animate),320,240-48)
							}
						
						break;
					}
				default:
					{
						draw_sprite_ext(s_fade_white,0,0,0,1,1,0,c_white,transalpha)
						
						if transalpha > 0.8
							{
								draw_sprite(s_pxpa_quickload_dark,round(animate),320,240-48)
							}
						break;
					}
			}

#endregion
draw_set_halign(fa_left)
draw_set_valign(fa_bottom)
draw_set_font(f_shop)
draw_set_color(make_color_rgb(current_time/2,current_time/4,current_time/6))
if global.debug.debug_enabled then draw_text(0,244,"pixelparty debug build")
draw_set_color(c_white)
