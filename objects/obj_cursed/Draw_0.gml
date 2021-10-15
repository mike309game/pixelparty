/*rotx += keyboard_check(eLetter.w) - keyboard_check(eLetter.q);
roty += keyboard_check(eLetter.s) - keyboard_check(eLetter.a);
matrix_set(matrix_world, matrix_build(x,y,depth,rotx,roty,image_angle,1,1,1));
draw_sprite(sprite_index, 0, 0, 0);
matrix_set(matrix_world, matrix_build_identity());*/
draw_self();
image_xscale += 1;
image_yscale += 1;
image_alpha -= 0.01;
if(image_alpha <= 0) then instance_destroy()