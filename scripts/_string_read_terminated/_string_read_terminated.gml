// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.stringReadReturn = "";
function string_read_terminated(string, pointer, terminators, returnNextLetter /*= 1*/){
	gml_pragma("forceinline");
	var termListLen = array_length(terminators);
	var terminatorPointer = 999999999;
	global.errorCode = eErrorCode.terminatorNotFound;
	for(var i = 0; i < termListLen; i++) {
		var ptrr = string_pos_ext(terminators[i], string, pointer);
		if(ptrr == 0) then continue;
		if(ptrr < terminatorPointer) {
			//HELP PLEASE
			//if(string_ord_at(string, terminatorPointer-1) == eChar.backslash) then begin array_push(terminators, terminators[i]); termListLen++;end
			terminatorPointer = ptrr;
			global.errorCode = eErrorCode.success;
		}
	}
	global.stringReadReturn = /*[*/string_copy(string, pointer, (terminatorPointer - pointer))/*, terminatorPointer + returnNextLetter]*/;
	return terminatorPointer + returnNextLetter;
}

/*var test = "[the beginning lol,more testing,please work aaaaaaaaaugh]sdjfnsdjfnjsdnfjnsdf[TESTTESTTEST]smkdnjsndjnjsdnf[MORETEST]JFGNJFNG[ENDER]";
for(var ptrr = string_pos("[", test); ptrr != 0; ptrr = string_pos_ext("[", test, ptrr)) {
	var res = string_read_terminated(test, ptrr+1, ["]", ","], 0);
	ptrr = res[1];
	show_message("the string is \"" + res[0] + "\", the pointer is currently at \"" + string_char_at(test, ptrr) + "\"");
}
show_message("buh byeeeeeeeeeeeeeeeeeeeeeee");
game_end();*/