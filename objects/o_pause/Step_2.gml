selection = max(0,selection)


switch mode
	{
		case 0:
			{
				selection = min(array_length(menu)-1,selection)
				break;
			}
		case 1:
			{
				selection = min(selection,2)
				break;
			}
	}