if(!gotMe) {
	gotMe = true;
	other.movementer.StopMoving();
	x = other.x + 8;
	y = other.y - 36;
	Sound(sx_puzzle_collect, random_range(0.9,1.1));
	NegateGameFlag(eFlag.playerCanSetSprite | eFlag.playerCanMove); //don't let player move and change its sprite
	other.sprite_index = s_manny_get_piece;
	event_perform(ev_alarm,0);
}