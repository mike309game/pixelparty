/// @description create sep maps for dialoguer

var characters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
					"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
					"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "!", "\"", "$", "%", "'", "(", ")", ",", "-", ".", "/", ":", ";", "<", "=", ">", "?", "_", "©"];

var charactersLen = array_length(characters);

var surf = surface_create(64,64);

var char;
draw_set_font(f_main);
for(var i = 0; i < charactersLen; i++) {
	char = characters[i];
	surface_set_target(surf);
	draw_clear_alpha(0,0);
	draw_text(0,0,char);
	surface_reset_target();
	//surface_save(surf, "C:\\fontshit\\" + string(i) + ".PNG");
	
	var surfbuff = buffer_create(4*64*64, buffer_fixed, 1);
	buffer_get_surface(surfbuff, surf, 0);
	//show_debug_message(i);
	var foundoffset = 0;
	var offset = 0;
	
	for(var xx = 0; xx < 64; xx++) { //yes i want it to count vertically
		var gotpixels = 0;
		for(var yy = 0; yy < 64; yy++) {
			var pixel = buffer_peek(surfbuff, 4*(xx+yy*64), buffer_u32);
			if(pixel != 0) {
				if(!foundoffset) {
					foundoffset = 1;
					offset = xx;
					show_debug_message("global.FONTNAME_offsets[?\"" + string(/*ord*/(char)) + "\"]=" + string(offset) + ";");
				}
				gotpixels = 1;
			}
		}
		if(!gotpixels && foundoffset) {
			show_debug_message("global.FONTNAME_widths[?\"" + string(/*ord*/(char)) + "\"]=" + string(xx-offset) + ";");
			break;
		}
	}
	buffer_delete(surfbuff);
}
surface_free(surf)
game_end();