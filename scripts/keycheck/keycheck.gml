//https://cherrytree.at/misc/vk.htm

enum eLetter {
	dollar = 36,
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
	b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z,
	backslash = 92
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