var inputX = 0;
var inputY = 0;

if(GetGameFlag(eFlag.playerCanMove)) {
	inputX = GetInput(eInput.right,true) - GetInput(eInput.left,true);
	inputY = GetInput(eInput.down,true) - GetInput(eInput.up,true);
}

movementer.Move(inputX,inputY);
movementer.Collide(GetGameFlag(eFlag.playerCanCollide));

var xCenter = floor(bbox_left + ((bbox_right - bbox_left) / 2));
var yCenter = floor(bbox_top + ((bbox_bottom - bbox_top) / 2));

#region Messy interact collision stuff
	var reduceAmt = 0;
	var vert = false;
	var xx1,yy1,xx2,yy2;
	switch(dir) {
		case 2:
			vert = true;
			break;
		case 6:
			vert = true;
		case 4:
			reduceAmt = 16*2;
			break;
	}
	
	if(vert) {
		xx1 = xCenter - 6;
		xx2 = xCenter + 6;
		yy1 = yCenter;
		yy2 = (yCenter - 16) + reduceAmt;
	} else {
		yy1 = yCenter - 6;
		yy2 = yCenter + 6;
		xx1 = xCenter;
		xx2 = (xCenter + 16) - reduceAmt;
	}
#endregion

var interacted = collision_rectangle(
	xx1,
	yy1,
	xx2,
	yy2,
	obj_interactable,false,false
)
with(interacted) {
	hovering = true;
	if(GetInputPressed(eInput.interact) && GetGameFlag(eFlag.playerCanInteract | eFlag.playerCanMove)) {
		event_user(0);
	}
}

if(GetGameFlag(eFlag.playerCanSetSprite)) {
	sprite_index = sprites[dir];
	image_speed = movementer.moving * 0.2 * (x != xprevious || y != yprevious);
	image_index *= movementer.moving * (x != xprevious || y != yprevious);
}

if(GetGameFlag(eFlag.cameraFocusOnPlayer)) { //if can center on me
	CamCenterHitbox();
}

SetDepth();