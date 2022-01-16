if cut = 1
	{
		fade = 0
		if !global.vars.puz_odd then Sound(sx_puzzle_appear) else Sound(sx_puzzle_appear_odd)
	}