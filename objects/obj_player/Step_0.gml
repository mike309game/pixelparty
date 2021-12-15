depth = -y-16;
movementer.Move(keycheck(vk_right) - keycheck(vk_left),keycheck(vk_down) - keycheck(vk_up));
movementer.Collide();

var xCenter = floor(bbox_left + ((bbox_right - bbox_left) / 2));
var yCenter = floor(bbox_top + ((bbox_bottom - bbox_top) / 2));

with(obj_interactable) {
	hovering = false;
}

var interacted = collision_line(
	xCenter,
	yCenter,
	xCenter + floor(lengthdir_x(20,dir*45)),
	yCenter + floor(lengthdir_y(20,dir*45)),
	obj_interactable,false,false
)
with(interacted) {
	hovering = true;
	if(keycheck_pressed(vk_enter) && global.flag & eFlag.playerCanInteract) {
		event_user(0);
	}
}
sprite_index = sprites[dir];
image_speed = movementer.moving * 0.2;
image_index *= movementer.moving;
CamCenterHitbox();