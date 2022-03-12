///@desc flash, fade out cloud background, for last state
NegateGameFlag(eFlag.fadeBlack);
MANAGER.fadeValue = 1;
MANAGER.fadeSpeed = 0.04;
backgroundFadeOut = true;
FadeOut();
state++;