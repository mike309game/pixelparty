// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///Read text file and assure unix encoding because easier
function ReadAssuredLf(fname){
	gml_pragma("forceinline");
	var fp = file_text_open_read(fname);
	var result = "";
	while(!file_text_eof(fp)) {
		result += file_text_read_string(fp); file_text_readln(fp);
		result += "\n";
	}
	file_text_close(fp);
	/*var len = string_length(result);
	for(var i = 1;i <= len; i++) {
		show_debug_message(string_char_at(result,i) + " " + string(string_ord_at(result,i)));
	}*/
	return result;
}