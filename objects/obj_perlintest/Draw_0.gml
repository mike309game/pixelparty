/*shader_set(sh_perlintest);
shader_set_uniform_f(utime, global.time);
shader_set_uniform_f(utimediv, mouse_x);
shader_set_uniform_f(uspecial, special3 / mouse_y);*/
draw_sprite_tiled_ext(sprite_index, 0,
x / specialdepth + camera_get_view_x(camera_get_active()) / specialdepth * 4,
y / specialdepth + camera_get_view_y(camera_get_active()) / specialdepth*4,
1, 1, 100 | (17 << 8) | (17 << 16), 0.2);
//shader_reset();