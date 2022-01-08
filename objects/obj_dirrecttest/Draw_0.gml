var drawRect = function(dir,x,y) {	
	var reduceAmt = 0;
	var vert = false;
	var xx1,yy1,xx2,yy2;
	switch(dir) {
		case 90:
			vert = true;
			break;
		case 270:
			vert = true;
		case 180:
			reduceAmt = 25*2;
			break;
	}
	
	if(vert) {
		xx1 = x - 6;
		xx2 = x + 6;
		yy1 = y;
		yy2 = (y - 25) + reduceAmt;
	} else {
		yy1 = y - 6;
		yy2 = y + 6;
		xx1 = x;
		xx2 = (x + 25) - reduceAmt;
	}
	
	draw_rectangle_color(xx1,yy1,xx2,yy2,c_green,c_green,c_green,c_green,false);
	draw_point_color(x,y,c_white);
}

/*draw_set_font(fntSmall);
draw_text(0,0,
"q-w: dir change of point 1 " + string(dirPoint1) +
"\na-d: dir change of point 2 " + string(dirPoint2) + "\nthis is useless fuck this"
);*/

drawRect(0,160,40);
drawRect(90,160,80);
drawRect(180,160,120);
drawRect(270,160,160);