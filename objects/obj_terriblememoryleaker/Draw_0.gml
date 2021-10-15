var listSize = ds_list_size(objL);
//var tex = sprite_get_texture(sprite_index, 0);
//draw_set_colour(c_red);
for(var i = 0; i < listSize; i++) {
	var list = objL[|i];
	//matrix_set(matrix_world, matrix_build(list.xx, list.xy, 0, 0, 0, list.direction, list.image_xscale, list.image_yscale, 0));
	draw_sprite_ext(sprite_index, 0, list.xx, list.xy, list.image_xscale, list.image_yscale, list.direction, c_red, list.image_alpha);
	//draw_set_alpha(list.image_alpha);
	//vertex_submit(square, pr_trianglelist, tex);
}
matrix_set(matrix_world, identity);
draw_set_colour(c_white);
draw_text(0,0,listSize);