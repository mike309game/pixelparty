//https://cherrytree.at/misc/vk.htm

/*show_message(ord("["));
show_message(ord("]"));
game_end();*/

/*var file = ["crlf.txt","lf.txt","test.txt"];
var files = array_length(file);
for(var ii = 0; ii < files; ii++) {
	show_debug_message(file[ii]);
	var fp = file_text_open_read(file[ii]);
	var text = file_text_read_string(fp);
	var len = string_length(text);
	for(var i = 1;i <= len; i++) {
		show_debug_message(string_char_at(text,i) + " " + string(string_ord_at(text,i)));
	}
	file_text_close(fp);
}*/

enum eChar {
	newline = 10,
	exclamation = 33,
	quote = 34,
	hash,
	dollar,
	ampersand = 38,
	zero = 48,
	one,
	two,
	three,
	four,
	five,
	six,
	seven,
	eight,
	nine,
	semicolon = 59,
	lt, //<
	equal,
	gt, //>
	at = 64, //@
	a,
	b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z,
	squareBracketL = 91, backslash, squareBracketR, pipe = 124
}

//undertale moments

function keycheck(key){
	gml_pragma("forceinline");
	switch(key) {
		//key presses
		case vk_enter:
			return keyboard_check(vk_enter) || keyboard_check(eChar.z);
		case vk_shift:
			return keyboard_check(vk_shift) || keyboard_check(eChar.x);
		case vk_control:
			return keyboard_check(vk_control) || keyboard_check(eChar.c);
		//dirs
		case vk_up:
			return keyboard_check(vk_up);
		case vk_down:
			return keyboard_check(vk_down);
		case vk_left:
			return keyboard_check(vk_left);
		case vk_right:
			return keyboard_check(vk_right);
	}
	return 0;
}

function keycheck_pressed(key){
	gml_pragma("forceinline");
	switch(key) {
		case vk_enter:
			return keyboard_check_pressed(vk_enter) || keyboard_check_pressed(eChar.z);
		case vk_shift:
			return keyboard_check_pressed(vk_shift) || keyboard_check_pressed(eChar.x);
		case vk_control:
			return keyboard_check_pressed(vk_control) || keyboard_check_pressed(eChar.c);
		//dirs
		case vk_up:
			return keyboard_check_pressed(vk_up);
		case vk_down:
			return keyboard_check_pressed(vk_down);
		case vk_left:
			return keyboard_check_pressed(vk_left);
		case vk_right:
			return keyboard_check_pressed(vk_right);
	}
	return 0;
}

function keycheck_released(key){
	gml_pragma("forceinline");
	switch(key) {
		case vk_enter:
			return keyboard_check_released(vk_enter) || keyboard_check_released(eChar.z);
		case vk_shift:
			return keyboard_check_released(vk_shift) || keyboard_check_released(eChar.x);
		case vk_control:
			return keyboard_check_released(vk_control) || keyboard_check_released(eChar.c);
		//dirs
		case vk_up:
			return keyboard_check_released(vk_up);
		case vk_down:
			return keyboard_check_released(vk_down);
		case vk_left:
			return keyboard_check_released(vk_left);
		case vk_right:
			return keyboard_check_released(vk_right);
	}
	return 0;
}