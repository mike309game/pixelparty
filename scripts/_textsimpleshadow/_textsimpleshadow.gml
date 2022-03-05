function DrawTextSimpleShadow(x,y,text,alpha = 1,c0 = c_white,c1 = c_white,c2 = c_white,c3 = c_white){
	gml_pragma("forceinline");
	var trueC1, trueC2, trueC3, trueC4;
	for(var i = 1; i >= 0; i--) {
		if(i == 1) {
			trueC1 = 0;
			trueC2 = 0;
			trueC3 = 0;
			trueC4 = 0;
		} else {
			trueC1 = c0;
			trueC2 = c1;
			trueC3 = c2;
			trueC4 = c3;
		}
		draw_text_colour(x+i,y+i,text,trueC1,trueC2,trueC3,trueC4,alpha);
	}
}