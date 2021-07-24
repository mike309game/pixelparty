draw_set_alpha(0.3)
draw_rectangle_color(0,0,320,220, c_black, c_black, c_black, c_black, 0)
draw_rectangle_color(0,220,320,240, c_aqua, c_aqua, c_aqua, c_aqua, 0)
draw_set_alpha(1)
draw_set_font(f_main)
draw_set_color(c_black)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_text(4,225,string_copy(textfield,1,string_length(textfield)))
if blinktimer % 40 < 20then draw_line(4+string_width(textfield),235,4+string_width(textfield)+8,235)

for(var i = 0; i < ds_list_size(display_queue); i++)
	{
		draw_set_color(c_red)
		draw_text(4,210-i*8,ds_list_find_value(display_queue,ds_list_size(display_queue)-i-1))
	}