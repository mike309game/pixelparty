//this can be improved (don't create an info struct every call, have a vertex buffer)
//addendum to above: use Sprite3D now lol

function DrawSpriteNoCullingExt(sprite, index, x, y, sizex, sizey, angle, colour, alpha, z = 0){
	gml_pragma("forceinline");
	var info = sprite_get_info(sprite); //info.frames[index].x_offset, crop_width THIS IS A STRUCT whyyy
	var width = info.frames[index].crop_width;// * sizex;
	var height = info.frames[index].crop_height;// * sizey;
	
	//push pos & scale
	mtxpush(matrix_build(x,y,z,0,0,angle,sizex,sizey,1));
	//push pivot offset
	mtxpush(matrix_build(-info.xoffset,-info.yoffset,0,0,0,0,1,1,1));
	//push offset
	mtxpush(matrix_build(info.frames[index].x_offset,info.frames[index].y_offset,0,0,0,0,1,1,1));
	
	//set matrix
	mtxset();
	
	//draw_primitive_begin_texture(pr_trianglefan, sprite_get_texture(sprite, index));
	draw_primitive_begin_texture(pr_trianglefan, info.frames[index].texture);
	draw_vertex_texture_colour(0,0,0,0,colour,alpha);
	draw_vertex_texture_colour(width,0,1,0,colour,alpha);
	draw_vertex_texture_colour(width,height,1,1,colour,alpha);
	draw_vertex_texture_colour(0,height,0,1,colour,alpha);
	draw_primitive_end();
	
	//reset matrix
	mtxpop(3);
	mtxset();
	
	//dispose
	delete info;
}