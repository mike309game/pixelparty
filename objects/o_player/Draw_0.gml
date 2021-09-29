if !global.vars.got_puzzle
	{
		no_draw = false
	} else {
		draw_sprite_part(s_player_extras,0,4*48-48,0,48,48,x,y)
		no_draw = true
		global.player.move = 0
	}
	
	if !no_draw then draw_sprite_part(s_player,0,offset*48-48,floor(ani)*48-48,48,48,x,y) // DRAW PLAYER

	
if pos
	{
		draw_text(x+48,y,x)
		draw_text(x+48,y+16,y)
	}