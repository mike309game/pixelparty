perlinX += (keyboard_check(eChar.q) - keyboard_check(eChar.w)) / perlinDiv;
perlinY += (keyboard_check(eChar.a) - keyboard_check(eChar.s)) / perlinDiv;
perlinZ += (keyboard_check(eChar.z) - keyboard_check(eChar.x)) / perlinDiv;
perlinMax = max(perlinMax, perlin(perlinX, perlinY, perlinZ));

hspeed = perlin(global.time / 100 + 471.346378, global.time / 100 + 41.8564, 0.1748174);
vspeed = perlin(global.time / 100, global.time / 100 + 41.8564, 0.74874);
//image_angle = ;