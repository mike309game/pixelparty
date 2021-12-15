// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///Center camera on object hitbox
function CamCenterHitbox(){
	gml_pragma("forceinline");
	SetCamPos(
		clamp(floor(bbox_left+((bbox_right - bbox_left)/2)-160),0,room_width-320),
		clamp(floor(bbox_top+((bbox_bottom - bbox_top)/2)-120),0,room_height-240)
	);
}

function SetCamPos(x,y) {
	gml_pragma("forceinline");
	global.camX = x;
	global.camY = y;
	camera_set_view_pos(view_camera[0],x,y);
}

function CamSetX(x) {
	gml_pragma("forceinline");
	global.camX = x;
}
function CamSetY(y) {
	gml_pragma("forceinline");
	global.camX = y;
}
function CamApply() {
	gml_pragma("forceinline");
	camera_set_view_pos(view_camera[0],global.camX,global.camY);
}