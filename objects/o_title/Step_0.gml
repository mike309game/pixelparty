bgX -= 0.3
bgY -= 0.3
timer++

fade = clamp(fade,0,1)
scale = clamp(scale,0,1)

if timer > 100 then fade -= 0.01

if timer = 200 
	{
		Sound("sx_title_grow",0)	
	}
if timer >= 200 
	{
		scale = lerp(scale,1,.1)
	}
if timer = 250
	{
		Music("mx_title",0)
	}

if keyboard_check_pressed(vk_left) then selection = 1
if keyboard_check_pressed(vk_up) then selection = 2
if keyboard_check_pressed(vk_right) then selection = 3