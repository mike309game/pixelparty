function invCheck(itemID) // check for item in inventory
	{
		for(var i = 0; i < ds_list_size(global.pickupInv); i++)
			{
				if ds_list_find_value(global.pickupInv,i) == itemID
					{
						show_debug_message("item was found")
						return true;
					}
			}
	}
	
function invAdd(itemID) // add item
	{
		show_debug_message("item added")
		ds_list_insert(global.pickupInv,0,itemID)
	}

function invRemove(itemID) // remove item
	{
		for(var i = 0; i < ds_list_size(global.pickupInv); i++)
			{
				if ds_list_find_value(global.pickupInv,i) == itemID
					{
						show_debug_message("item found and removed")
						ds_list_delete(global.pickupInv,i)
						break;
					}
			}
	}
