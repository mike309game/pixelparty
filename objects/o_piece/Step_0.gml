if(!gotMe) {
	y = round(ystart + 6 * sin((global.time + xstart*50)/12));
} else {
	
}
image_alpha = min(image_alpha + 0.03, 1);
SetDepth();