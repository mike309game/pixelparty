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
				switch global.debug.build_type
					{
						case "ps":
							selection = min(selection,2)
							break;
						case "pc":
							selection = min(selection,5)
							break;
						case "web":
							selection = min(selection,3)
							break;
					}
				
				break;
			}
	}