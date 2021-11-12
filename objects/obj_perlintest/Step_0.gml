var thistime = global.time / 10;
var xperlin = perlin(special1 + thistime / 112, special2 + thistime / 110, thistime / 200) * 4;
x += xperlin;
var yperlin = perlin(special3 + thistime /111, special4 + thistime / 124 + 84841, thistime / 260) * 4;
y += yperlin;

//image_angle = point_direction(x, y, xprevious, yprevious);