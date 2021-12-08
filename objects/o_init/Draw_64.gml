
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
if global.debug.debug_enabled && global.debug.debug_hud then draw_text(0,244,"pixelparty debug build")
draw_set_color(c_white)

#region Room Sign

if sign_do then level_sign_timer++

if (level_sign_timer > 50 && level_sign_timer < 150) && sign_do
	{
		if level_sign_y > (240-32) then level_sign_y -= 1
	}
if level_sign_timer > 150 then level_sign_y += 0.5
	
switch string_copy(room_get_name(room),3,2)
	{
		case "l1":
			{
				draw_sprite_part(s_level_signs,0,0,0,80,32,120,round(level_sign_y))
				global.gameevent[? "l1_e0"] = 1
				break;
			}
		case "l2":
			{
				draw_sprite_part(s_level_signs,0,0,32,80,32,120,round(level_sign_y))
				global.gameevent[? "l2_e0"] = 1
				break;
			}
		case "l3":
			{
				draw_sprite_part(s_level_signs,0,0,64,80,32,120,round(level_sign_y))
				global.gameevent[? "l3_e0"] = 1
				break;
			}
	}
//draw_sprite_part(s_level_signs,0,0,0,80,32,320-80,level_sign_y)

#endregion