draw_set_font(f_jaxfont);
//draw_text_transformed(0,0,dlgString,0.5,0.5,0);

draw_sprite(s_textbox_bright,0,0,0);

matrix_set(matrix_world,mtxHalf);
draw_text_correctly(0,0,dlgString,true,dlgPointer);
matrix_set(matrix_world, defaultMatrix);
fmtstring_draw(18,196,typewriter.letterList,0);