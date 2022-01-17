show_debug_message("manager draw end");
global.drawingGui = true;
matrix_set(matrix_world, matrix_build(global.camX, global.camY, 0, 0, 0, 0, 1, 1, 1));
while(!ds_stack_empty(global.guiInstancesStack)) {
	//event_perform_object(ds_stack_pop(global.guiInstancesStack), ev_draw, ev_draw_end);
	with(ds_stack_pop(global.guiInstancesStack)) { //i don't know why, but event_perform_object doesn't work
		event_perform(ev_draw, ev_draw_end);
	}
}

#region Room Sign

if sign_do then level_sign_timer++

if (level_sign_timer > 50 && level_sign_timer < 150) && sign_do
	{
		if level_sign_y > (240-32) then level_sign_y -= 1
	}
if level_sign_timer > 150 then level_sign_y += 0.5
	
switch string_copy(room_get_name(room),3,2)
	{
		case "l1":
			{
				draw_sprite_part(s_level_signs,0,0,0,80,32,120,round(level_sign_y))
				global.gameevent[? "l1_e0"] = 1
				break;
			}
		case "l2":
			{
				draw_sprite_part(s_level_signs,0,0,32,80,32,120,round(level_sign_y))
				global.gameevent[? "l2_e0"] = 1
				break;
			}
		case "l3":
			{
				draw_sprite_part(s_level_signs,0,0,64,80,32,120,round(level_sign_y))
				global.gameevent[? "l3_e0"] = 1
				break;
			}
	}
//draw_sprite_part(s_level_signs,0,0,0,80,32,320-80,level_sign_y)

#endregion

matrix_set(matrix_world, defaultMatrix);
global.drawingGui = false;