//https://cherrytree.at/misc/vk.htm

/*show_message(ord("["));
show_message(ord("]"));
game_end();*/

enum eChar {
	hash = 35,
	dollar,
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
	at = 64,
	a,
	b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z,
	squareBracketL = 91, backslash, squareBracketR
}

//undertale moments

function keycheck(key){
	gml_pragma("forceinline");
	switch(key) {
		case eChar.z:
			return keyboard_check(vk_enter) || keyboard_check(eChar.z);
		case eChar.x:
			return keyboard_check(vk_shift) || keyboard_check(eChar.x);
		case eChar.c:
			return keyboard_check(vk_control) || keyboard_check(eChar.c);
	}
	return 0;
}

function keycheck_pressed(key){
	gml_pragma("forceinline");
	switch(key) {
		case eChar.z:
			return keyboard_check_pressed(vk_enter) || keyboard_check_pressed(eChar.z);
		case eChar.x:
			return keyboard_check_pressed(vk_shift) || keyboard_check_pressed(eChar.x);
		case eChar.c:
			return keyboard_check_pressed(vk_control) || keyboard_check_pressed(eChar.c);
	}
	return 0;
}

function keycheck_released(key){
	gml_pragma("forceinline");
	switch(key) {
		case eChar.z:
			return keyboard_check_released(vk_enter) || keyboard_check_released(eChar.z);
		case eChar.x:
			return keyboard_check_released(vk_shift) || keyboard_check_released(eChar.x);
		case eChar.c:
			return keyboard_check_released(vk_control) || keyboard_check_released(eChar.c);
	}
	return 0;
}