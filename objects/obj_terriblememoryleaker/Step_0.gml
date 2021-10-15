/*repeat(1) begin
with(instance_create_depth(x,y,0,obj_cursed)) {
	image_alpha = 0.5;
	direction = irandom_range(0, 360);
	image_angle = direction;
	speed = 0.1;
}
end*/

repeat(1) {
	ds_list_add(objL, new cObj(x,y,irandom_range(270,360),0.5));
}
var listSize = ds_list_size(objL);
for(var i = 0; i < listSize; i++) {
	var list = objL[|i];
	if(list.image_alpha <= 0) {
		delete list;
		ds_list_delete(objL, i);
		listSize--;
		list = objL[|i];
		//list = new cObj(x,y,irandom_range(0,360),0.5);
		//objL[|i] = list;
	}
	list.xx += lengthdir_x(1, list.direction);
	list.xy += lengthdir_y(1, list.direction);
	list.image_alpha -= 0.001;
	list.image_xscale -= 0.01;
	list.image_yscale -= 0.01;
}