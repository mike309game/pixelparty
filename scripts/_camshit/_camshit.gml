// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @func					CamCenterHitbox()
/// @desc					Center camera on instance's hitbox's center
function CamCenterHitbox(){
	gml_pragma("forceinline");
	SetCamPos(
		clamp(floor(bbox_left+((bbox_right - bbox_left)/2)-160),0,room_width-320),
		clamp(floor(bbox_top+((bbox_bottom - bbox_top)/2)-120),0,room_height-240)
	);
}

/// @func					SetCamPos(x,y)
/// @desc					Set camera position with x and y coordinates
/// @arg {real} [x]			X position of camera
/// @arg {real} [y]			Y position of camera
/// @arg {bool} [inbounds]	Ensure the camera is inbounds
function SetCamPos(x = global.camX, y = global.camY, inbounds = true) {
	gml_pragma("forceinline");
	global.camX = x;
	global.camY = y;
	camera_set_view_pos(view_camera[0],x,y);
}

/*function CamSetX(x) {
	gml_pragma("forceinline");
	global.camX = x;
}
function CamSetY(y) {
	gml_pragma("forceinline");
	global.camX = y;
}*/

/// @func					CamApply()
/// @desc					Apply the values of global.camX and global.camY to the camera
function CamApply() {
	gml_pragma("forceinline");
	camera_set_view_pos(view_camera[0],global.camX,global.camY);
}