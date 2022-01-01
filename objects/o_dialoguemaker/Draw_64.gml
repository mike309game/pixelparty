draw_set_font(f_main);
//draw_text_transformed(0,0,dlgString,0.5,0.5,0);

draw_sprite(s_textbox_bright,0,0,0);

var sep = 0;
var spacing = 0;
var len = string_length(dlgString);
matrix_set(matrix_world,mtxHalf);
for(var i = 1; i <= len; i++) {
	var char = string_char_at(dlgString,i);
	if(char == "\n") {
		spacing += 15;
		sep = 0;
		continue;
	}
	var charWidth = global.JaxLarge_widths[? char] ?? 4;
	var charOffset = global.JaxLarge_offsets[? char] ?? 0;
	sep -= charOffset;
	draw_text(sep,spacing,char);
	sep += charWidth + charOffset + 1;
	if(i == dlgPointer) {
		draw_set_alpha(abs(sin(global.time / 8) * 0.5));
		draw_rectangle(sep-1,spacing,sep+1,spacing+15,false);
		draw_set_alpha(1);
	}
}
matrix_set(matrix_world, defaultMatrix);
fmtstring_draw(18,196,typewritter.letterList,0);