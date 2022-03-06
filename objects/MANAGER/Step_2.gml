
//hacky solution for audio "channels"
//if ever need actual positional audio, i'll redo this, i wish you could create listeners
audio_emitter_position(global.soundEmitter, 0, 0, 0);
audio_emitter_gain(global.soundEmitter, global.soundMasterVolume * global.masterVolume);
audio_emitter_position(global.musicEmitter, 0, 0, 0);
audio_emitter_gain(global.musicEmitter, global.musicMasterVolume * global.masterVolume);
audio_listener_position(0,0,0);
