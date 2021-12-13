if tr = 1
	{
		var po = "s_manny_talk"
		switch string_lower(name)
			{
				case "manny":
					{
						po = "s_manny_talk"
						break;
					}
				case "tester":
					{
						po = "s_creepy_talk"
						break;
					}
				case "sign":
					{
						po = "s_sign_talk"
						break;
					}
				case "bully":
					{
						po = "s_bully_talk"
						break;
					}
				case "lexsie":
					{
						po = "s_lexsie_talk"
						break;
					}
				case "dex":
					{
						po = "s_dex_talk"
						break;
					}
				case "honstay":
					{
						po = "s_honstay_talk"
						break;
					}
				case "...":
					{
						po = "s_nothing"
						break;
					}
				case "":
					{
						po = "s_nothing"
						break;
					}
				case "buxy":
					{
						po = "s_buxy_talk"
						break;
					}
				case "dyiexy":
					{
						po = "s_dyiexy_talk"
						break;
					}
				case "ricky":
					{
						po = "s_ricky_talk"
						break;
					}
				case "hux":
					{
						po = "s_hux_talk"
						break;
					}
				case "bean boy":
					{
						po = "s_bean_talk"
						break;
					}
				default:
					{
						po = "s_creepy_talk"
						break;
					}
			}
			if p_alt = 0 
				{
				draw_sprite(asset_get_index(po),0,0,0)
				} else {
					if sprite_exists(asset_get_index(po+"_alt_"+string(p_alt)))
						{
							draw_sprite(asset_get_index(po+"_alt_"+string(p_alt)),0,0,0)
						}
				}
	}
draw_sprite_part(asset_get_index("s_textbox_"+global.player.area),0,0,0,320,80,0,240-80+_y)
if count >= string_length(text)
	{
		draw_sprite_part(s_psxbuttons,0,0,0,16,16,293,225+_y)
		//draw_sprite_part(asset_get_index("s_textbox_"+global.player.area),0,0,80,320,80,0,240-80+_y)
	} else {
		
	}

draw_set_font(f_main)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black)

draw_set_alpha(0.2)
draw_text(18+shadowoffset,198+shadowoffset+_y,string_copy(text,1,floor(count)))
draw_text(205+shadowoffset,178+shadowoffset+_y,name)
draw_set_alpha(1)
draw_text(18,198+_y,string_copy(text,1,count))
draw_text(205,178+_y,name)