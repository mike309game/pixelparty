// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum eLetter {
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
	a = 65,
	b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z
}

//undertale moments

function keycheck(key){
	gml_pragma("forceinline");
	switch(key) {
		case eLetter.z:
			return keyboard_check(vk_enter) || keyboard_check(eLetter.z);
		case eLetter.x:
			return keyboard_check(vk_shift) || keyboard_check(eLetter.x);
		case eLetter.c:
			return keyboard_check(vk_control) || keyboard_check(eLetter.c);
	}
	return 0;
}

function keycheck_pressed(key){
	gml_pragma("forceinline");
	switch(key) {
		case eLetter.z:
			return keyboard_check_pressed(vk_enter) || keyboard_check_pressed(eLetter.z);
		case eLetter.x:
			return keyboard_check_pressed(vk_shift) || keyboard_check_pressed(eLetter.x);
		case eLetter.c:
			return keyboard_check_pressed(vk_control) || keyboard_check_pressed(eLetter.c);
	}
	return 0;
}

function keycheck_released(key){
	gml_pragma("forceinline");
	switch(key) {
		case eLetter.z:
			return keyboard_check_released(vk_enter) || keyboard_check_released(eLetter.z);
		case eLetter.x:
			return keyboard_check_released(vk_shift) || keyboard_check_released(eLetter.x);
		case eLetter.c:
			return keyboard_check_released(vk_control) || keyboard_check_released(eLetter.c);
	}
	return 0;
}