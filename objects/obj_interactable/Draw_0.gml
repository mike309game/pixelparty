draw_self();
//failsafe vars
var xx = (x - sprite_xoffset) + sprite_width / 2;
var yy = y - sprite_yoffset;
with(obj_player) { //avoid funny crash
  xx = (x - sprite_xoffset) + sprite_width / 2;
  yy = y - sprite_yoffset;
}
if(hovering) {
  draw_sprite(s_interact,0,xx+13,yy+12);
}