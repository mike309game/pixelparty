//vfmt3dsprite


/*function Sprite3D(sprite) constructor {
	info = sprite_get_info(sprite);
	frames = info.num_subimages;
	mesh = array_create(frames*2); //double because we need to store the texture
	for(var i = 0; i < frames; i++) {
		var posx = info.frames[i].x_offset - info.xoffset;
		var posy = info.frames[i].y_offset - info.yoffset;
		var xw = posx + info.frames[i].crop_width;
		var yh = posy + info.frames[i].crop_height;
		var uv = sprite_get_uvs(sprite, i);
		var thisMesh = vertex_create_buffer();
		vertex_begin(thisMesh, vfmt3dsprite);
		
		//top left
		vertex_position_3d(thisMesh, posx, 0, posy);
		vertex_texcoord(thisMesh, uv[0], uv[1]);
		vertex_colour(thisMesh, c_white, 1);
		
		//top right
		vertex_position_3d(thisMesh, xw, 0, posy);
		vertex_texcoord(thisMesh, uv[2], uv[1]);
		vertex_colour(thisMesh, c_white, 1);
		
		//bottom right
		vertex_position_3d(thisMesh, xw, 0, yh);
		vertex_texcoord(thisMesh, uv[2], uv[3]);
		vertex_colour(thisMesh, c_white, 1);
		
		//bottom left
		vertex_position_3d(thisMesh, posx, 0, yh);
		vertex_texcoord(thisMesh, uv[0], uv[3]);
		vertex_colour(thisMesh, c_white, 1);
		
		vertex_end(thisMesh);
		mesh[i*2] = thisMesh;
		mesh[(i*2)+1] = info.frames[i].texture;
	}
	delete info;
}*/

function Sprite3D(sprite) {
	var info = sprite_get_info(sprite);
	var size = info.num_subimages;
	var data = array_create(size * 9 + 1);
	data[0] = size;
	for(var i = 0; i < size; i++) {
		var posx = info.frames[i].x_offset - info.xoffset;
		var posy = info.frames[i].y_offset - info.yoffset;
		var xw = posx + info.frames[i].crop_width;
		var yh = posy + info.frames[i].crop_height;
		var uv = sprite_get_uvs(sprite, i);
		var realI = i * 9;
		data[realI + 1] = posx;
		data[realI + 2] = posy;
		data[realI + 3] = xw;
		data[realI + 4] = yh;
		data[realI + 5] = uv[0];
		data[realI + 6] = uv[1];
		data[realI + 7] = uv[2];
		data[realI + 8] = uv[3];
		data[realI + 9] = info.frames[i].texture;
	}
	delete info;
	return data;
}

function DrawSprite3D(sprite3d, frame, x, y, z, angle, xscale, yscale, colour = c_white, alpha = 1) {
	if(live_call(sprite3d, frame, x, y, z, angle, xscale, yscale, colour, alpha)) then return live_result;
	frame = floor(frame % sprite3d[0]);
	var frameIdx = frame * 9;
	
	//push pos & scale
	mtxpush(matrix_build(x,y,z,90,0,0,xscale,1,yscale)); //-yscale cuz stupid z
	//push angle
	mtxpush(matrix_build(0,0,0,0,0,angle,1,1,1));
	
	//set matrix to stack top
	mtxset();
	
	var posx = sprite3d[frameIdx + 1];
	var posy = sprite3d[frameIdx + 2];
	var xw = sprite3d[frameIdx + 3];
	var yh = sprite3d[frameIdx + 4];
	var uv0 = sprite3d[frameIdx + 5];
	var uv1 = sprite3d[frameIdx + 6];
	var uv2 = sprite3d[frameIdx + 7];
	var uv3 = sprite3d[frameIdx + 8];
	
	draw_primitive_begin_texture(pr_trianglefan, sprite3d[frameIdx + 9]);
	draw_vertex_texture_color(posx, posy, uv0, uv1, colour, alpha);
	draw_vertex_texture_color(xw, posy, uv2, uv1, colour, alpha);
	draw_vertex_texture_color(xw, yh, uv2, uv3, colour, alpha);
	draw_vertex_texture_color(posx, yh, uv0, uv3, colour, alpha);
	draw_primitive_end();
	
	//pop matrix
	mtxpop(); //pop angle matrix
	mtxpop(); //pop position matrix
	//set top
	mtxset();
}

/*function DrawSprite3D(sprite3d, frame, x, y, z, angle, xscale, yscale, colour = c_white, alpha = 1) {
	frame = floor(frame % sprite3d.frames);
	var oldColour = draw_get_colour();
	var oldAlpha = draw_get_alpha();
	
	//push pos & scale
	mtxpush(matrix_build(x,y,z,0,angle,0,xscale,1,-yscale)); //-yscale cuz stupid z
	//set matrix to stack top
	mtxset();
	
	draw_set_colour(colour);
	draw_set_alpha(alpha);
	
	shader_set(shPassthrough);
	vertex_submit(sprite3d.mesh[frame*2], pr_trianglefan, sprite3d.mesh[frame*2+1])
	shader_reset();
	
	draw_set_colour(oldColour);
	draw_set_alpha(oldAlpha);
	
	//pop matrix
	mtxpop();
	//set top
	mtxset();
}*/