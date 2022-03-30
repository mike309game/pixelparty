draw_text(0,0,timer)

draw_set_alpha(alpher)

switch character
	{
		case "tb":
			{
				if timer < 4
					{
						draw_sprite_part(asset_get_index("s_"+character+"_party"),0,0,0,232,16,47,100)
					}
				if timer >= 4
					{
						draw_sprite_part(asset_get_index("s_"+character+"_party"),0,0,0,232,32,47,100)
					}


				draw_set_font(f_jax)
				draw_set_halign(fa_left)
				draw_set_color(c_white)
				//10 15
				if timer >= 10
					{
						draw_text(116+7,130,"JOINED")
					}
				if timer >= 12
					{
						draw_text(164+7,130,"YOU!")
					}
	
				draw_set_alpha(1)

				if timer >= 20
					{
						alpher -= 0.01
					}
				if alpher <= 0 then instance_destroy(id)
			}
	}

