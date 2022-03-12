yProgress = clamp(yProgress + (goUp ? 1 : -1), 0, 120);

y = EaseInOutCubic(ystart, ystart - 48, yProgress / 120);
obj_player.movementer.SetPos(x-8,y);

if(fadeOut) {
	fadeAlpha = max(fadeAlpha - 0.04, 0);
} else {
	fadeAlpha = min(fadeAlpha + 0.04, 1);
}