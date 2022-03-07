// Saving Functions

function SaveVolumeSettings() {
	ini_write_real("Volume", "Master", global.masterVolume);
	ini_write_real("Volume", "Music", global.musicMasterVolume);
	ini_write_real("Volume", "Sound", global.soundMasterVolume);
}

function SaveGame() {
	var section = "SaveData" + string(global.saveFile);
	ini_write_real(section, "Exists", 1);
	//ini_write_string(section, "Name", global.script_variables[? "name"]);
	ini_write_real(section, "Characters", global.script_variables[? "partyMembers"]);
	ini_write_real(section, "Time", global.time);
	ini_write_string(section, "Room", room_get_name(room)); //name cuz gms2 shuffles room ids sometimes
	ini_write_string(section, "Flag", string(global.flag));
	ini_write_string(section, "Values", ds_map_write(global.script_variables));
	ini_close();
	ini_open(working_directory + "/savedata");
}

function LoadGame() {
	var section = "SaveData" + string(global.saveFile);
	global.flag = int64(ini_read_string(section, "Flag", "-9223372036854775808"));
	global.time = ini_read_real(section, "Time", "0");
	ds_map_clear(global.script_variables);
	ds_map_read(global.script_variables, ini_read_string(section, "Values", "93010000010000000100000007000000494E56414C494400000000000000000000F03F")); //ds map with string key "INVALID" set to 1
	return (asset_get_index(ini_read_string(section, "Room", "r_title")));
}

/*function CheckExistence() {
	return ini_read_real("SaveData" + string(global.saveFile), "Exists", 0);
}*/

/*var test = ds_map_create();
test[? "INVALID"] = 1;
show_message(ds_map_write(test));*/

/*
---------------------------
Pixel Party
---------------------------
93010000010000000100000007000000494E56414C494400000000000000000000F03F
---------------------------
OK   
---------------------------

*/

/*function save_init()
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
				//init() //no
			}
	}

function save_save()
	{
		show_message("actual saving unavailable for now")
		ini_open(working_directory + "pxpa_save.ini")
			ini_write_real("player","puzzle",global.player.puzzle)
			ini_write_real("player","money",global.player.money)
			//ini_write_real("game","catpart",global.catparts.part)
			//ini_write_real("game","gate",global.gates.gate)
			//ini_write_real("game","shop_l1",global.shop_start_tables.l1)
			//ini_write_real("game","shop_l2",global.shop_start_tables.l2)
			//ini_write_real("game","shop_l3",global.shop_start_tables.l3)
			ini_write_real("game","gameevent",global.gameevent)
		ini_close()
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
	}*/