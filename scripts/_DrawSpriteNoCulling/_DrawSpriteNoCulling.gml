
function DrawSpriteNoCullingExt(sprite, index, x, y, sizex, sizey, angle, colour, alpha){
	gml_pragma("forceinline");
	var info = sprite_get_info(sprite); //info.frames[index].x_offset, crop_width THIS IS A STRUCT whyyy
	var width = info.frames[index].crop_width;// * sizex;
	var height = info.frames[index].crop_height;// * sizey;
	
	//push pos & scale
	matrix_stack_push(matrix_build(x,y,0,0,0,angle,sizex,sizey,1));
	//push pivot offset
	matrix_stack_push(matrix_build(-info.xoffset,-info.yoffset,0,0,0,0,1,1,1));
	//push offset
	matrix_stack_push(matrix_build(info.frames[index].x_offset,info.frames[index].y_offset,0,0,0,0,1,1,1));
	
	//set matrix
	matrix_set(matrix_world, matrix_stack_top());
	
	draw_primitive_begin_texture(pr_trianglefan, sprite_get_texture(sprite, index));
	draw_vertex_texture_colour(0,0,0,0,colour,alpha);
	draw_vertex_texture_colour(width,0,1,0,colour,alpha);
	draw_vertex_texture_colour(width,height,1,1,colour,alpha);
	draw_vertex_texture_colour(0,height,0,1,colour,alpha);
	draw_primitive_end();
	
	//reset matrix
	matrix_stack_pop();
	matrix_stack_pop();
	matrix_stack_pop();
	matrix_set(matrix_world, matrix_stack_top());
	
	//dispose
	delete info;
}