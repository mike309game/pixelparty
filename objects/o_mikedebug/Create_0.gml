//depth = 999999999;
//see how many rooms there are
var roomcount = 0;
buffer = buffer_create(1, buffer_grow, 1);
while(room_exists(roomcount)) {
	buffer_write(buffer, buffer_string, room_get_name(roomcount));
	roomcount++;
}
imgui_setup_buffers(buffer_get_address(buffer), roomcount);

//set up imgui
var os = os_get_info();
imgui_setup(window_handle(), os[?"video_d3d11_device"], os[?"video_d3d11_context"]);
ds_map_destroy(os);

//disable viewports so shit won't fuck up
/*var flags = imgui_io_get_config_flags();
flags &= ~(ImGuiConfigFlags.ViewportsEnable | ImGuiConfigFlags.NavEnableKeyboard);
imgui_io_set_config_flags(flags);*/

//matrices
prioritymatrix = matrix_build(0,0,9999,0,0,0,1,1,1);
defaultmatrix = matrix_build_identity();