EVTLIVE;
//var hor = GetInput(eInput.right, true) - GetInput(eInput.left, true);
//playerX += hor;
var len = ds_list_size(objects);
for(var i = 0; i < len; i++) {
	objects[|i].Step(undefined);
}