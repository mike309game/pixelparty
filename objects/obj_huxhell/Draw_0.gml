//$7C7CB2
shader_set(shd_noise);
shader_set_uniform_f(uTime,global.time);
shader_set_uniform_f(uAmmount,8);
matrix_set(matrix_world,middleMatrix);

for(var i = 0; i < 9; i++) {
	var xscale = irandom_range(0,1000) == 1 ? 3 : 1;
	var yscale = irandom_range(0,1000) == 1 ? 3 : 1;
	draw_sprite_ext(sprite_index,0,random_range(-1,1),random_range(-1,1),xscale,yscale,0,$7C7CB2,i / 9);
}

matrix_set(matrix_world,defaultMatrix);
shader_reset();
draw_sprite_ext(ovly,2,0,0,1,1,0,c_white,0.9);