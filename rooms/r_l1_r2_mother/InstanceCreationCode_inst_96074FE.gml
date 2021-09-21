file = "level1"
if !invCheck("wheat")
	{
		find = "person1_1"
	} else {
		if ds_map_find_value(global.gameevent,"l1_e1") = 0
			{
				find = "person1_2"
			} else {
				find = "person1_3"
			}
		
	}

