//depth = 999999999;
//see how many rooms there are

//buffer = buffer_create(1, buffer_grow, 1);

mouseXOld = display_mouse_get_x();
mouseYOld = display_mouse_get_y();

pizzaButtonPressed = false;

debugButtonAlpha = 1;
debugButtonAlphaSpeed = 0;
alarm[0] = 60*2;

menuShown = false;
bgFade = 0;

tapDebug = new TapDebug();
tapDebugState = 0;

tapDebugCallback = function(a) {
	switch(tapDebugState) {
		case 0: //main state
			switch(a) {
				case 0:
					tapDebugState = 1;
					tapDebugListCurrent = tapDebugRooms;
					break;
				case 1:
					tapDebugState = 1;
					break;
				case 2:
					menuShown = false;
					break;
			}
			break;
		case 1: //state for menus which have back button as 1st item
			switch(a) {
				case 0:
					tapDebugState = 0;
					tapDebugListCurrent = tapDebugMain
					break;
			}
			break;
	}
}

tapDebugCheatsCallback = function(a) {
	switch(a) {
		case 0:
			break;
	}
}

tapDebugRoomCallback = function(a) {
	room_goto(asset_get_index(tapDebugRooms[a][0]));
}

smoothSpacing = 0;

//label, type, callback, additionalArgs, tapState

tapDebugMain = [
	["Rooms", eDebugItemType.buttonCallback, tapDebugCallback, 0, 0],
	["Cheats", eDebugItemType.buttonCallback, tapDebugCallback, 0, 0],
	["Quit menu", eDebugItemType.buttonCallback, tapDebugCallback, 0, 0],
];

tapDebugRooms = [
	["Back", eDebugItemType.buttonCallback, tapDebugCallback, 0, 0]
];

tapDebugCheats = [
	["Back", eDebugItemType.buttonCallback, tapDebugCallback, 0, 0],
	["Enable Movement", eDebugItemType.buttonCallback, tapDebugCheatsCallback, 0, 0],
	["Noclip", eDebugItemType.buttonCallback, tapDebugCheatsCallback, 0, 0],
	["Sect 1 values", eDebugItemType.buttonCallback, tapDebugCheatsCallback, 0, 0],
]

tapDebugListCurrent = tapDebugMain;

roomCount = 0;
roomList = ds_list_create();
roomChosen = 0;

while(room_exists(roomCount)) {
	//buffer_write(buffer, buffer_string, room_get_name(roomcount));
	ds_list_add(roomList,room_get_name(roomCount++));
}
ds_list_sort(roomList,true);
var len = ds_list_size(roomList);
for(var i = 0; i < len; i++) {
	array_push(tapDebugRooms, [roomList[|i], eDebugItemType.buttonCallback, tapDebugRoomCallback, 0, 0]);
}
ds_list_destroy(roomList);



//imgui_setup_buffers(buffer_get_address(buffer), roomcount);

//set up imgui
//var os = os_get_info();
//imgui_setup(window_handle(), os[?"video_d3d11_device"], os[?"video_d3d11_context"]);
//ds_map_destroy(os);

//disable viewports so shit won't fuck up
/*var flags = imgui_io_get_config_flags();
flags &= ~(ImGuiConfigFlags.ViewportsEnable | ImGuiConfigFlags.NavEnableKeyboard);
imgui_io_set_config_flags(flags);*/

//matrices
//prioritymatrix = matrix_build(0,0,9999,0,0,0,1,1,1);
//defaultmatrix = matrix_build_identity();
