surf = surface_create(320,240)
surfapp = surface_create(320,240)

if surface_exists(surf)
	{
		surface_set_target(surf) // background and other shit
			draw_sprite_tiled(s_pause_bg,0,bgX,bgY)
		surface_reset_target()
		draw_surface_ext(surf,0,0,1,1,0,c_white,1)
		
		
		surface_set_target(surfapp)
		gpu_set_blendmode_ext(bm_dest_alpha,bm_src_alpha_sat)
			draw_surface(application_surface,0,0)
		gpu_set_blendmode(bm_normal)
		surface_reset_target()
		
		

		draw_surface_ext(surf,0,0,1,1,0,c_white,1)
		draw_surface_ext(surfapp,surX - 4,surY-2,surS+0.02,surS+0.02,surR,c_black,1)
		draw_surface_ext(surfapp,surX,surY,surS,surS,surR,c_white,1)
		// x4 y32 scale0.5 rot10
		
	}

surface_free(surf)
surface_free(surfapp)