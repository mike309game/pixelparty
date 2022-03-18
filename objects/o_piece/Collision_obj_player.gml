if(!gotMe && GetGameFlag(eFlag.playerCanMove)) {
	gotMe = true;
	other.movementer.StopMoving();
	x = other.x + 8;
	y = other.y - 36;
	Sound(sx_puzzle_collect, random_range(0.9,1.1));
	NegateGameFlag(eFlag.playerCanSetSprite | eFlag.playerCanMove); //don't let player move and change its sprite
	other.sprite_index = s_manny_get_piece;
	global.script_variables[? "pieces"] += 1;
	global.script_variables[? "gold"] += 5;
	alarm[0] = 60*3;
	depth = -9999;
}