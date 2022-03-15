// Inherit the parent event
event_inherited();

x = xstart + irandom_range(-shakeAmt,shakeAmt);
y = ystart + irandom_range(-shakeAmt,shakeAmt);

shakeAmt = max(shakeAmt - 1, 0);

if(room == r_l1_r6) {
	if(!instance_exists(pieceInstance)) {
		instance_destroy(o_npc_jarl);
	}
}