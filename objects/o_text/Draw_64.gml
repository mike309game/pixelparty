if tr = 1
	{
		switch string_lower(name)
			{
				case "manny":
					{
						draw_sprite(s_manny_talk,0,0,0)
						break;
					}
				case "tester":
					{
						draw_sprite(s_creepy_talk,0,0,0)
						break;
					}
			}
	}
if count >= string_length(text)
	{
		draw_sprite_part(asset_get_index("s_textbox_"+global.player.area),0,0,80,320,80,0,240-80+_y)
	} else {
		draw_sprite_part(asset_get_index("s_textbox_"+global.player.area),0,0,0,320,80,0,240-80+_y)
	}

draw_set_font(f_main)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black)

draw_set_alpha(0.2)
draw_text(18+shadowoffset,198+shadowoffset+_y,string_copy(text,1,floor(count)))
draw_text(220+shadowoffset,178+shadowoffset+_y,name)
draw_set_alpha(1)
draw_text(18,198+_y,string_copy(text,1,count))
draw_text(220,178+_y,name)