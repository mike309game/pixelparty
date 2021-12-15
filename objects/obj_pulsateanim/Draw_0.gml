shader_set(shd_noise);
shader_set_uniform_f(uTime,global.time);
shader_set_uniform_f(uAmmount,2);
for(var i = 0; i < 8; i++) {
	var scale = sin((global.time/10)/i*4)*0.5+1;
	draw_sprite_ext(sprite_index,0,x,y,scale,scale,0,image_blend,(i+1)/7.4);
}
//terribnle stop
draw_sprite_ext(sprite_index,0,x+(((global.time >> 4)*567416841)&3),y+(((global.time >> 4)*84851691)&3),1.5,1.5,0,image_blend,1);
shader_reset();