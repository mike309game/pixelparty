fade = clamp(fade,0,2)
if shader_is_compiled(sh_wave)
	{
		shader_set(sh_wave)
		shader_set_uniform_f(shader_get_uniform(sh_wave, "timer"), timer);

		switch show
			{
				case "h1":
					{
						draw_sprite_ext(s_honestary_level1,0,160,120,fade,fade,0,c_white,fade)
						break
					}
			}
		shader_reset()
	}
	
if cuttimer > 50 && cuttimer < 300
	{
		fade = lerp(fade,1.8,.02)
	}
if cuttimer = 300 then global.player.move = 1 else if cuttimer < 300 then  global.player.move = 0
if cuttimer > 300
	{
		fade = lerp(fade,0,.02)
	}
if cuttimer > 200 && fade <= 0.01 then instance_destroy(self)