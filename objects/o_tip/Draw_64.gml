if timer < 60 then alp = lerp(alp,0.7,.1)
if timer > 180 then alp = lerp(alp,0,.1)

timer++



if timer >180 && alp <= 0.1
	{
		instance_destroy(id)
		global.player.move = 1
	}


draw_sprite_ext(s_fade_black,0,0,0,1,1,0,c_white,alp)

draw_set_font(f_shop)
draw_set_color(c_white)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

draw_set_alpha(2*alp)
draw_text(160,70,"tip:")
draw_text(160,120,string_hash_to_newline(tipdata[rand]))
draw_set_alpha(1)