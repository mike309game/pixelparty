//gc_enable(0);
cObj = function(_x, _y, _direction, _alpha) constructor {
	xx = _x;
	xy = _y;
	image_xscale = 10;
	image_yscale = 10;
	direction = _direction;
	image_alpha = _alpha;
}

objL = ds_list_create();
/*repeat(count) {
	ds_list_add(objL, new cObj(x,y,irandom_range(0,360),0.5));
}*/

vertex_format_begin();
vertex_format_add_position();
vertex_format_add_texcoord();
vertex_format_add_colour();
var verty = vertex_format_end();

var uvs = sprite_get_uvs(sprite_index, 0);
square = vertex_create_buffer();

vertex_begin(square, verty);

vertex_position(square, 0, -0.5);
vertex_texcoord(square, uvs[0], uvs[1]);
vertex_colour(square, c_white, 1);

vertex_position(square, 1, -0.5);
vertex_texcoord(square, uvs[2], uvs[1]);
vertex_colour(square, c_white, 1);

repeat(2) begin
vertex_position(square, 1, 0.5);
vertex_texcoord(square, uvs[2], uvs[3]);
vertex_colour(square, c_white, 1); end

vertex_position(square, 0, 0.5);
vertex_texcoord(square, uvs[0], uvs[3]);
vertex_colour(square, c_white, 1);

vertex_position(square, 0, -0.5);
vertex_texcoord(square, uvs[0], uvs[1]);
vertex_colour(square, c_white, 1);

vertex_end(square);

vertex_freeze(square);

identity = matrix_build_identity();