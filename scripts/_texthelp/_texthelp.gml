function TextAlignCenter(){
	gml_pragma("forceinline");
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
}

function TextAlignReset(){
	gml_pragma("forceinline");
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

function TextAlignRight(){
	gml_pragma("forceinline");
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
}