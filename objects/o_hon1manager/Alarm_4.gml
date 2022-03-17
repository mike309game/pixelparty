///@desc flash, fade out cloud background, for last state
NegateGameFlag(eFlag.fadeBlack);
MANAGER.fadeValue = 1;
MANAGER.fadeSpeed = 0.04;
backgroundFadeOut = true;
FadeOut();
state++;
audio_sound_gain(ambience, 0, 200);
audio_play_sound_on(global.musicEmitter, snd_amb_introfadeout, false, 0);