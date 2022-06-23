if DEBUGMODE
	{
		if keyboard_check(vk_tab)
			{
				draw_text(8,8,"fps: "+string(fps))
				if fps < 45 then draw_text(8,16,"fix ur shit tard")
				
			}
	}
