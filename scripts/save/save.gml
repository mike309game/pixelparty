// Saving Functions

function save_init()
	{
		if !file_exists(working_directory + "pxpa_save.ini")
			{
				//show_message("file no exist so i make :)")
				ini_open(working_directory+ "pxpa_save.ini")
				ini_write_string("ex","ex","1")
				ini_close();
			} else {
				file_delete(working_directory + "pxpa_save.ini")
				ini_open(working_directory+ "pxpa_save.ini")
				ini_write_string("ex","ex","1")
				ini_close();
				init()
			}
	}

function save_save()
	{
		show_message("actual saving unavailable for now")
	}

function save_load()
	{
		show_message("actual loading unavailable for now")
	}

function save_delete()
	{
		file_delete(working_directory + "pxpa_save.ini")
		show_debug_message("Save File Deleted")
	}
	
function save_setting()
	{
		ini_open(working_directory + "pxpa_settings.ini")
		ini_write_real("sound","music",global.setting.music)
		ini_write_real("sound","sfx",global.setting.sound)
		ini_write_real("setting","scale",global.setting.scale)
		ini_write_real("setting","sync",global.setting.vsync)
		ini_write_real("setting","full",global.setting.full)
		ini_close()
	}
function save_setting_load()
	{
		if file_exists(working_directory + "pxpa_settings.ini")
			{
				ini_open(working_directory + "pxpa_settings.ini")
				global.setting.music = ini_read_real("sound","music",100)
				global.setting.sound = ini_read_real("sound","sfx",100)
				global.setting.scale = ini_read_real("setting","scale",2)
				global.setting.vsync = ini_read_real("setting","sync",0)
				global.setting.full = ini_read_real("setting","full",0)
				ini_close()
			} else {
				show_debug_message("no settings file")
			}
	}