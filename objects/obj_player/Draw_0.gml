draw_self();

if(isHovering && GetGameFlag(eFlag.playerCanInteract | eFlag.playerCanMove)) {
	draw_sprite(s_interact,0,((x - sprite_xoffset) + sprite_width / 2)+13,(y - sprite_yoffset)+12);
}

//draw_line(x-2000, y, x+2000, y);

/*draw_set_font(f_jaxfont);
draw_text(x,y,"The Quiiiiick");
draw_sprite(s_lilhand,0,x+string_width("The Quiiiiick"),y);
draw_text(x,y+16,"testyiiiikkkkkiiiwwxxx");*/

//HonestaryDraw(keyboard_string,x,y,make_colour_hsv(global.time & 255, 255, 255));

//draw_point(x,);

/*draw_line(x+8,y+8,x+8+floor(lengthdir_x(20,dir*45)),
		y+8+floor(lengthdir_y(20,dir*45)));*/

/*var wantedx1 = lengthdir_x(10,(dir*45)+10);
var wantedy1 = lengthdir_y(10,(dir*45)+10);

var wantedx2 = lengthdir_x(40,(dir*45)-10);
var wantedy2 = lengthdir_y(40,(dir*45)-10);

draw_rectangle_colour(wantedx1+x,wantedy1+y,wantedx2+x,wantedy2+y,c_green,c_green,c_green,c_green,false);*/

//draw_text(x,y,keyboard_string);
/*draw_set_colour(c_white);
draw_set_font(fntSmall);
draw_text(x,y,
"realx=" + string(movementer.realX) +
"\nrealy=" + string(movementer.realY) +
"\nx=" + string(x) +
"\ny=" + string(y) +
"\nspdx=" + string(movementer.speedX) +
"\nspdy=" + string(movementer.speedY));*/