draw_set_alpha(0.4)
draw_set_color(c_black)
draw_ellipse(round(x)+9,round(y)+43,round(x)+(48-10),round(y)+48+2,0)
draw_set_alpha(1)

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