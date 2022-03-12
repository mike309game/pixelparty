//i'm not even gonna bother rewriting this, i don't have time for that, go fuck yourself
ifGui
	fade = clamp(fade,0,2)
	
	if shader_is_compiled(sh_wave) //this just won't be drawn at all in html5 then
		{
			shader_set(sh_wave)
			shader_set_uniform_f(shader_get_uniform(sh_wave, "timer"), timer);
			draw_sprite_ext(sprite_index,0,160,120,fade,fade,0,c_white,fade)
			shader_reset()
		}
	
		
	if cuttimer > 50 && cuttimer < 300
		{
			fade = lerp(fade,1.8,.02)
		}
	//if cuttimer = 300 then AssureGameFlag(eFlag.playerCanMove) else if cuttimer < 300 then  NegateGameFlag(eFlag.playerCanMove)
	if cuttimer > 300
		{
			fade = lerp(fade,0,.02)
		}
	if cuttimer > 200 && fade <= 0.01 then instance_destroy(self)
endGui