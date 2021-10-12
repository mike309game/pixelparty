
if event = "gamecrash"
	{
		if !crashdrawn
			{
				surface_set_target(surf)
					draw_surface(application_surface,0,0)
				surface_reset_target()
				crashdrawn = 1
				
			}
		draw_surface(surf,0,0)
	}