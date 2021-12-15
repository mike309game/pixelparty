if !parsed
	{
		var file = file_text_open_read(working_directory + "text/"+global.setting.lang+"/"+"gametips"+".txt")

		var i = 0
		while(!file_text_eof(file))
			{
				tipdata[i] = file_text_read_string(file)
				file_text_readln(file)
				i++
			}

		file_text_close(file)
		randomize()
		rand = irandom_range(0,array_length(tipdata)-1)
		parsed = 1
	}