
draw_sprite_ext(s_fade_black,0,0,0,1,1,0,c_white,alpha)

surf = surface_create(320,240)
surface_set_target(surf)
draw_clear_alpha(c_white,0)
draw_sprite_ext(s_honload,0,160,120,1,1,rot,c_white,elementalpha)
surface_reset_target()

draw_surface(surf,0,0)

surface_free(surf)