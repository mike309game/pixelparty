if freeze >= 60
	{
		if loadbar < 100 
			{
				draw_sprite(s_loading_text,0,160,210)
				draw_rectangle_color(32,220,32+(2.5*loadbar),230,c_green,c_green,c_lime,c_lime,0)
				if global.debug.build_type = "pc" || global.debug.build_type = "web" then draw_sprite(s_controller_keys,0,0,0) else draw_sprite(s_controller,0,0,0)
			}
		else if loadbar = 100
			{
				alarm_set(1,1)
			}
	}