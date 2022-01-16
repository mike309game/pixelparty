/// Dex Animation

fliptimer++

if fliptimer = 5 then Sound(sx_coin_flip)
audio_sound_pitch(sx_coin_flip,random_range(1,1.1))

if dexoffset > 4 || dexoffset < -4 then movedir ^= 1 // change dir

if movedir = 0 then dexoffset++ else dexoffset-- // move dexs body

alarm_set(0,25)