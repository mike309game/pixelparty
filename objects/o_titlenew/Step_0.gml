if(canProgress) {
	backgroundAlpha += 0.009;
	if(pxpaScaleCanProgress) {
		pxpaScale = EaseOutElastic(0, 1.0, pxpaScaleProgress / 120);
		pxpaScaleProgress = min(pxpaScaleProgress + 1, 120);
	}
	for(var i = 0; i < 10; i++) {
		if(pxpaLetterResizeCooldown[i]--) {
			pxpaLetterSize[i] = min(pxpaLetterSize[i] + 0.03, 1.2);
		} else {
			pxpaLetterSize[i] = max(pxpaLetterSize[i] - 0.03, 1);
		}
	}
}