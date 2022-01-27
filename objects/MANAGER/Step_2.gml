//what the fuck base
/*global.setting.music = min(global.setting.music,100)
global.setting.music = max(global.setting.music,0)

global.setting.sound = min(global.setting.sound,100)
global.setting.sound = max(global.setting.sound,0)

global.setting.scale = min(global.setting.scale,3)
global.setting.scale = max(global.setting.scale,1)

global.setting.vsync = min(global.setting.vsync,1)
global.setting.vsync = max(global.setting.vsync,0)

global.setting.full = min(global.setting.full,1)
global.setting.full = max(global.setting.full,0)*/

global.setting.music = clamp(global.setting.music, 0, 100);
global.setting.sound = clamp(global.setting.sound, 0, 100);
global.setting.scale = clamp(global.setting.scale, 1, 3);
global.setting.vsync &= 1; //make true if value is odd
global.setting.full &= 1; //same as above


//hacky solution for audio "channels"
//if ever need actual positional audio, i'll redo this, i wish you could create listeners
audio_emitter_position(global.soundEmitter, 0, 0, 0);
audio_emitter_gain(global.soundEmitter, global.soundMasterVolume);
audio_emitter_position(global.musicEmitter, 0, 0, 0);
audio_emitter_gain(global.musicEmitter, global.musicMasterVolume);
audio_listener_position(0,0,0);

//audio_group_set_gain(agrp_music, global.setting.music / 100, 0);
//audio_group_set_gain(agrp_sounds, global.setting.sound / 100, 0);