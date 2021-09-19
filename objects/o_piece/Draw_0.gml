var pos = createY + 12 * sin(degtorad(timer)*3.5)
var rad = 12 * sin(degtorad(timer)*3.5)

if global.vars.got_puzzle = 0 || (global.vars.got_puzzle = 1 && global.vars.puz_pid != pid)
	{
			draw_set_alpha(fade/2)
			draw_circle_color(x,y+24,(10+(rad/2)),c_black,c_black,0)
			draw_set_alpha(1)
			draw_sprite_ext(s_puzzle_piece,0,x,pos,scale,scale,0,c_white,fade)
	} else {
		if global.vars.puz_pid = pid
			{
				untimer++
				draw_sprite_ext(s_puzzle_piece,0,o_player.x+24,o_player.y-4,scale,scale,0,c_white,1)
			}
	}
