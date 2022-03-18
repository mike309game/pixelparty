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
	colon = 58,
	semicolon = 59,
	lt, //<
	equal,
	gt, //>
	at = 64, //@
	a,
	b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z,
	squareBracketL = 91, backslash, squareBracketR, pipe = 124
}

enum eInput {
	x = 1 << 0,
	o = 1 << 1,
	square = 1 << 2,
	triangle = 1 << 3,
	
	right = 1 << 4,
	up = 1 << 5,
	left = 1 << 6,
	down = 1 << 7,
	
	start = 1 << 8,
	select = 1 << 9,
	
	l1 = 1 << 10,
	r1 = 1 << 11,
	
	l2 = 1 << 12,
	r2 = 1 << 13,
	
	//Subject to change
	
	interact = eInput.x,
	proceedText = eInput.x,
	skipText = eInput.o,
	boost = eInput.square
}

function GetInput(buttons, mathable = false) { //mathable is for calculating math with the output
	gml_pragma("forceinline");
	if(mathable) {
		return real((global.input & buttons) == buttons);
	} else {
		return global.input & buttons;
	}
}
function GetInputPressed(buttons, mathable = false) { //mathable is for calculating math with the output
	gml_pragma("forceinline");
	if(mathable) {
		return real((global.inputPressed & buttons) == buttons);
	} else {
		return global.inputPressed & buttons;
	}
}
function GetInputReleased(buttons, mathable = false) { //mathable is for calculating math with the output
	gml_pragma("forceinline");
	if(mathable) {
		return real((global.inputReleased & buttons) == buttons);
	} else {
		return global.inputReleased & buttons;
	}
}

function FreezeInput(buttons) {
	gml_pragma("forceinline");
	global.inputFrozen |= buttons;
	//ProcessInput(); //re process
	//show_message("input being FROZEN is " + string(buttons) + " and callstack is " + CallstackString());
}

function UnfreezeInput(buttons) {
	gml_pragma("forceinline");
	global.inputFrozen &= ~buttons;
	//ProcessInput(); //re process
}

function UnfreezeAllInput() {
	gml_pragma("forceinline");
	global.inputFrozen = int64(0);
	//ProcessInput(); //re process
}

function AllowInput(buttons) {
	gml_pragma("forceinline");
	global.inputAllowed |= buttons;
	//ProcessInput(); //re process
}

function ForbidInput(buttons) {
	gml_pragma("forceinline");
	global.inputAllowed &= ~buttons;
	//ProcessInput(); //re process
}

function ForbidAllInputExcept(buttons) {
	gml_pragma("forceinline");
	global.inputAllowed = buttons;
	//ProcessInput(); //re process
}

function AllowAllInput() {
	gml_pragma("forceinline");
	global.inputAllowed = int64(-1);
	//ProcessInput(); //re process
}

function ProcessInput() {
	gml_pragma("forceinline");
	global.input = (
		(eInput.x *			(keyboard_check(eChar.z) || gamepad_button_check(0, gp_face1))) |
		(eInput.o *			(keyboard_check(eChar.x) || gamepad_button_check(0, gp_face2))) |
		(eInput.square *	(keyboard_check(eChar.x) || gamepad_button_check(0, gp_face3))) | //you said this is fine
		(eInput.triangle *	gamepad_button_check(0, gp_face4)) | //not needed
		
		(eInput.up *		(keyboard_check(vk_up) || gamepad_button_check(0, gp_padu))) |
		(eInput.down *		(keyboard_check(vk_down) || gamepad_button_check(0, gp_padd))) |
		(eInput.left *		(keyboard_check(vk_left) || gamepad_button_check(0, gp_padl))) |
		(eInput.right *		(keyboard_check(vk_right) || gamepad_button_check(0, gp_padr))) |
		
		(eInput.start *		(keyboard_check(vk_enter) || gamepad_button_check(0, gp_start))) |
		(eInput.select *	(keyboard_check(vk_shift) || gamepad_button_check(0, gp_select))) |
		
		(eInput.l1 *		gamepad_button_check(0, gp_shoulderl)) |
		(eInput.r1 *		gamepad_button_check(0, gp_shoulderr)) |
		
		(eInput.l2 *		gamepad_button_check(0, gp_shoulderlb)) |
		(eInput.r2 *		gamepad_button_check(0, gp_shoulderrb)) |
		global.inputFrozen
	) & global.inputAllowed;
	
	global.inputPressed = (
		(eInput.x *			(keyboard_check_pressed(eChar.z) || gamepad_button_check_pressed(0, gp_face1))) |
		(eInput.o *			(keyboard_check_pressed(eChar.x) || gamepad_button_check_pressed(0, gp_face2))) |
		(eInput.square *	(keyboard_check_pressed(eChar.x) || gamepad_button_check_pressed(0, gp_face3))) | //you said this is fine
		(eInput.triangle *	gamepad_button_check_pressed(0, gp_face4)) | //not needed
		
		(eInput.up *		(keyboard_check_pressed(vk_up)		|| gamepad_button_check_pressed(0, gp_padu))) |
		(eInput.down *		(keyboard_check_pressed(vk_down)	|| gamepad_button_check_pressed(0, gp_padd))) |
		(eInput.left *		(keyboard_check_pressed(vk_left)	|| gamepad_button_check_pressed(0, gp_padl))) |
		(eInput.right *		(keyboard_check_pressed(vk_right)	|| gamepad_button_check_pressed(0, gp_padr))) |
		
		(eInput.start *		(keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_start))) |
		(eInput.select *	(keyboard_check_pressed(vk_shift) || gamepad_button_check_pressed(0, gp_select))) |
		
		(eInput.l1 *		gamepad_button_check_pressed(0, gp_shoulderl)) |
		(eInput.r1 *		gamepad_button_check_pressed(0, gp_shoulderr)) |
		
		(eInput.l2 *		gamepad_button_check_pressed(0, gp_shoulderlb)) |
		(eInput.r2 *		gamepad_button_check_pressed(0, gp_shoulderrb))
	) & global.inputAllowed;
	
	global.inputReleased = (
		(eInput.x *			(keyboard_check_released(eChar.z) || gamepad_button_check_released(0, gp_face1))) |
		(eInput.o *			(keyboard_check_released(eChar.x) || gamepad_button_check_released(0, gp_face2))) |
		(eInput.square *	(keyboard_check_released(eChar.x) || gamepad_button_check_released(0, gp_face3))) | //you said this is fine
		(eInput.triangle *	gamepad_button_check_released(0, gp_face4)) | //not needed
		
		(eInput.up *		(keyboard_check_released(vk_up)		|| gamepad_button_check_released(0, gp_padu))) |
		(eInput.down *		(keyboard_check_released(vk_down)	|| gamepad_button_check_released(0, gp_padd))) |
		(eInput.left *		(keyboard_check_released(vk_left)	|| gamepad_button_check_released(0, gp_padl))) |
		(eInput.right *		(keyboard_check_released(vk_right)	|| gamepad_button_check_released(0, gp_padr))) |
		
		(eInput.start *		(keyboard_check_released(vk_enter) || gamepad_button_check_released(0, gp_start))) |
		(eInput.select *	(keyboard_check_released(vk_shift) || gamepad_button_check_released(0, gp_select))) |
		
		(eInput.l1 *		gamepad_button_check_released(0, gp_shoulderl)) |
		(eInput.r1 *		gamepad_button_check_released(0, gp_shoulderr)) |
		
		(eInput.l2 *		gamepad_button_check_released(0, gp_shoulderlb)) |
		(eInput.r2 *		gamepad_button_check_released(0, gp_shoulderrb))
	) & global.inputAllowed;
}

//undertale moments

/*function keycheck(key){
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
}*/