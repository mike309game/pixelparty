function HonestaryDraw(text, x, y, colour, font = f_boldfelony){
	draw_set_font(font);
	
	for(var i = 3; i >= 0; i--) {
		switch(i) {
			case 1:
			case 3:
				draw_set_colour(c_black);
				break;
			case 0:
				draw_set_colour(c_white);
				break;
			case 2:
				draw_set_colour(colour);
				break;
		}
		
		for(var XX = 0; XX <= i; XX++) {
			for(var YY = 0; YY <= i; YY++) {
				draw_text(x,y-YY,text); //up
				//do a small bit less unecessary drawing
				if(i == 0) then break;
				draw_text(x,y+YY,text); //down
				draw_text(x-XX,y,text); //left
				draw_text(x+XX,y,text); //right
				
				draw_text(x-XX,y-YY,text); //up left
				draw_text(x-XX,y+YY,text); //down left
				draw_text(x+XX,y+YY,text); //up right
				draw_text(x+XX,y-YY,text); //down right
			}
		}
	}
	/*draw_set_font(f_boldfelony_bg);
	draw_text(x,y,text);
	draw_set_font(f_boldfelony_colourable);
	draw_set_colour(colour);
	draw_text(x,y,text);
	draw_set_colour(c_white);*/
}
draw_set_colour(c_white);