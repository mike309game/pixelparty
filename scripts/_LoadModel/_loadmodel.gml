// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

globalvar vfmt3d;
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_colour();
vfmt3d = vertex_format_end();

globalvar vfmt3dnoclr;
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vfmt3dnoclr = vertex_format_end();

globalvar vfmt3dsprite;
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_texcoord();
vertex_format_add_colour();
vfmt3dsprite = vertex_format_end();

function LoadModel(fname){
	var buffer = buffer_load(fname);
	var model = vertex_create_buffer_from_buffer(buffer, vfmt3d);
	buffer_delete(buffer);
	return model;
}

/*var test = vertex_create_buffer();
vertex_begin(test, vfmt3d);
vertex_position_3d(test, 5353, 7755, 9955);
vertex_normal(test, 420555,69666,778787);
vertex_texcoord(test, 1115, 3333);
vertex_colour(test, 121218, 0.8);
vertex_end(test);
buffer_create_from_vertex_buffer(test, buffer_fixed, 1);
buffer_save(test, "C:\\MW_WORKSPACE\\GAFGAF.asdf");*/
