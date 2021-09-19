selection = max(selection,0)

switch mode
	{
		case 1:
			{
				selection = min(selection,2)
				break;
			}
		case 2:
			{
				switch global.debug.build_type
					{
						case "ps":
							selection = min(selection,3)
							break;
						case "pc":
							selection = min(selection,6)
							break;
						case "web":
							selection = min(selection,4)
							break;
					}
				
				break;
			}
		case 3:
			{
				selection = min(selection,1)
				break;
			}
	}

flash = min(flash,1)
flash = max(flash,0)