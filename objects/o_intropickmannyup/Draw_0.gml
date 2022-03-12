draw_set_alpha(fadeAlpha/2);
draw_rectangle_colour(global.camX,global.camY,global.camX + 320,global.camY + 240,0,0,0,0,false);
draw_set_alpha(1);
draw_sprite_ext(sprite_index, 1, x, y, 1, 1, 0, c_white, fadeAlpha);
draw_sprite_ext(sprite_index, 0, x, y, 1, 1, global.time / 2, c_white, fadeAlpha);