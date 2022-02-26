surface_set_target(funny);
draw_line_colour(x,y, xprevious, yprevious, c_red, c_red);
surface_reset_target();
draw_surface(funny,0,0);
draw_text(0,0,"x: " + string(perlinX) + "\ny: " + string(perlinY) + "\nz: " + string(perlinZ) + "\nmax value: " + string(perlinMax));
draw_sprite_ext(sprite_index, 0, x, y, 1, 1, point_direction(x,y,xprevious,yprevious)-180, -1, 1);