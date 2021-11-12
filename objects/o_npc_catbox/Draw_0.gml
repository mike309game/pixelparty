if catmode = 0 then draw_sprite_part(s_catbox,0,animode*48-48,frame*48-48,48,48,x,y)
if place_meeting(x,y,o_player)
	{
		draw_sprite(s_interact,0,o_player.x+8,o_player.y)
	}
if timer > 100 && timer < 200 then draw_sprite_part(s_catbox,0,48,112,64,80,x,y-32)
if timer <= 100 || timer >= 200 then draw_sprite_part(s_catbox,0,animode*48-48,frame*48-48,48,48,x,y)