x += perlin(id,id,global.time / 100) * 0.3;
y += perlin(id,id,global.time / 100 + int64(id)) * 0.3;
image_alpha = sin(global.time / 30 + int64(id)) * 0.3 + 0.8;