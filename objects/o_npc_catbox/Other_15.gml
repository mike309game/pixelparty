sprite_index = s_catboxspit;
shakeAmt = 10;
alarm[1] = 30;
pieceInstance = instance_create_depth(x,y-32,depth,o_piece)
with(pieceInstance) {
	hspeed = 4;
	friction = 0.1;
}
o_npc_jarl.section = "level1-CatJarlAntiSoftlock";