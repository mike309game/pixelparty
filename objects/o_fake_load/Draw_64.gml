if loadbar < 100
	{
		draw_sprite(s_loading_text,0,160,120)
		draw_rectangle_color(32,220,32+(2.5*loadbar),230,c_green,c_green,c_lime,c_lime,0)
	}
else if loadbar = 100
	{
		alarm_set(1,1)
	}