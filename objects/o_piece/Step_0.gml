timer++
if timer > 10 then fade = lerp(fade,1,.1)

if instance_exists(o_player)
	{
		if o_player.y > createY-8 then depth = o_player.y+1 else depth = o_player.y-100
	}
	
if place_meeting(x,y,o_player)
	{
		global.vars.got_puzzle = 1
		global.vars.puz_pid = pid
	}

if global.vars.got_puzzle = -1
	{
		if scale > 0 then scale -= 0.03
	}
if untimer = 1
	{
		var pitch = random_range(0.9,1.1)
		Sound("sx_puzzle_collect",0)
		audio_sound_pitch(sx_puzzle_collect,pitch)
	}
if untimer = 100
	{
		global.player.puzzle++
		o_player.idle_timer = 401
	}
if untimer > 170
	{
		
		global.vars.got_puzzle = 0
		global.vars.puz_pid = -1
		global.player.move = 1
		instance_destroy(id)
	}