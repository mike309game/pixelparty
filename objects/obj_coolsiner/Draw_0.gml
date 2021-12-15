if(!surface_exists(surface)) {surface=surface_create(100,80);}
surface_set_target(surface);
//draw_surface(surface,0,0);fuck
draw_point(global.time%100,sin(global.time/40)*40+40);
surface_reset_target();
draw_surface(surface,x,y);