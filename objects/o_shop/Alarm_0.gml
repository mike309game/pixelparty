/// Dex Animation

fliptimer++

if dexoffset > 4 || dexoffset < -4 then movedir ^= 1 // change dir

if movedir = 0 then dexoffset++ else dexoffset-- // move dexs body

alarm_set(0,25)