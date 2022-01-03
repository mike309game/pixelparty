//fmtstring draw but simple (aka, correct spacing)

function draw_text_correctly(x,y,text,_drawSelectBeam = false, _beamPointer = 0){
	gml_pragma("forceinline");
	var sep = 0;
	var spacing = 0;
	var len = string_length(text);
	
	for(var i = 1; i <= len; i++) {
		var char = string_char_at(text,i);
		if(char == "\n") {
			spacing += 15;
			sep = 0;
			continue;
		}
		var charWidth = global.JaxLarge_widths[? char] ?? 4;
		var charOffset = global.JaxLarge_offsets[? char] ?? 0;
		sep -= charOffset;
		draw_text(sep + x,spacing + y,char);
		sep += charWidth + charOffset + 1;
		if(i == _beamPointer && _drawSelectBeam) { //from dialogue maker typer
			draw_set_alpha(abs(sin(global.time / 8) * 0.5));
			draw_rectangle(sep-1,spacing,sep+1,spacing+15,false);
			draw_set_alpha(1);
		}
	}
}