/*
if !file_exists(working_directory + "pxpa_save.ini")
	{
		//show_message("file no exist so i make :)")
		ini_open(working_directory+ "pxpa_save.ini")
		ini_write_string("ex","ex","1")
		ini_close();
	} else {
		//show_message("file exist")
	}