var zoneWidth = playfieldWidth;

draw_rectangle_color(0,32,zoneWidth*2,600,c_grey,c_grey,c_grey,c_grey,false);
var len = ds_list_size(objects);
for(var i = 0; i < len; i++) {
	var obj = objects[|i];
	draw_line_color(obj.myLine.x1 + zoneWidth, obj.myLine.y1 + camFocusRaceProgress, obj.myLine.x2 + zoneWidth, obj.myLine.y2 + camFocusRaceProgress, c_yellow,c_yellow);
}
while(!ds_stack_empty(checkStack)) {
	var line = ds_stack_pop(checkStack);
	draw_line_color(line.x1 + zoneWidth, line.y1 + camFocusRaceProgress, line.x2 + zoneWidth, line.y2 + camFocusRaceProgress, c_red,c_red);
}