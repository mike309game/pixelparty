draw_set_alpha(malpha)

draw_set_alpha(malpha/2)
draw_rectangle_color(x,y,x+sprite_width,y+sprite_height,c_blue,c_blue,c_blue,c_blue,0) //main
draw_rectangle_color(x,y,x+sprite_width,y+sprite_height,c_black,c_black,c_black,c_black,1) //outline
draw_set_alpha(malpha)

draw_set_font(f_shop)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(c_white)

draw_sprite(s_puzzle_piece,0,x+(0+sprite_width/2),y+(0+sprite_height/2))
draw_text(x+(0+sprite_width/2)+1,y+(0+sprite_height/2)+19,want)

draw_set_alpha(1)

//draw_circle_color(x+(sprite_width/2),y+(sprite_height/2),(sprite_width+sprite_height),c_red,c_red,1)