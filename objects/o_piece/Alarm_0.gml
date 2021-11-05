if cut = 1
	{
		fade = 0
		if !global.vars.puz_odd then Sound(sx_puzzle_appear,0) else Sound(sx_puzzle_appear_odd,0)
	}