if !global.vars.got_puzzle
	{
		no_draw = false
	} else {
		draw_sprite_part(s_player_extras,0,4*48-48,0,48,48,x,y)
		no_draw = true
		global.player.move = 0
	}
	
	if !no_draw then draw_sprite_part(s_player,0,offset*48-48,floor(ani)*48-48,48,48,x,y) // DRAW PLAYER

//gui shit
draw_gui_set;
draw_rectangle_color(6+5,timer_y-16,6+5+dash_cooldown,timer_y,c_yellow,c_yellow,c_yellow,c_yellow,0)
draw_sprite(s_cooldown_timer,0,8,timer_y)
//draw_text(x,y,dash_cooldown)
draw_sprite_ext(s_puzzle_collected_text,0,text_x,4+16,1,1,0,c_white,1)

draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white)
draw_set_font(f_main)
draw_text(text_x+175+30,4+26,global.player.puzzle)
draw_set_color(c_black)
draw_text(text_x+175+32,4+24,global.player.puzzle)

draw_sprite_ext(s_puzzle_collected,0,-4,4,1,1,0,c_white,1)
draw_gui_exit;