// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//var realX = (touchInputInfo[i][0] * global.gameSurfaceScale + windowCenterX) - 160 * global.gameSurfaceScale;
//var realY = (touchInputInfo[i][1] * global.gameSurfaceScale + windowCenterY) - 120 * global.gameSurfaceScale;

//used for translating pixel positions and stuff to actual screen coordinates
function PosToScreenCoord(pos, vertical){
	gml_pragma("forceinline");
	return (pos * global.gameSurfaceScale + (vertical ? global.windowCenterY : global.windowCenterX)) - (vertical ? 120 : 160) * global.gameSurfaceScale;
}