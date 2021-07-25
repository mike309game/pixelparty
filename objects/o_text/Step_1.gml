if !parsed
	{
		var _file = file_text_open_read("text/"+global.setting.lang+"/"+file+".txt")

		a = 0

		if file_exists("text/"+global.setting.lang+"/"+file+".txt")
			{
				//show_debug_message("work")
				while(!file_text_eof(_file))
					{
						parse[a] = file_text_read_string(_file)
						file_text_readln(_file)
						a++
					}
				if file_text_eof(_file)
					{
						parsed = 1
						a = 0
					}
			} else {
				show_debug_message("not: "+("text/"+global.setting.lang+"/"+file+".txt"))
			}
	
		file_text_close(_file)
	}