//this is a struct *just* because i don't want to copy paste identical code twice in the title screen and pause menu

function FileselectInterface(_saving, _destination = room) constructor {
	selectedFile = 0;
	saving = _saving;
	
	/*
	saveinfo array:
	1: save exists
	2: animation smoothing progress 0-20
	3: save party member count
	4: save playtime
	*/
	
	fileIndex = 0;
	selectedFile = false;
	saveInfo = ds_list_create();
	savedGameCooldown = 0;
	destination = _destination;
	
	RefreshSaveInfo();
	
	static RefreshSaveInfo = function() {
		ds_list_clear(saveInfo);
		saveInfo[|MAXSAVEFILES * 4 + 3] = 0; //set highest value already to avoid future resizing shenanigans
		for(var i = 0; i < MAXSAVEFILES; i++) {
			var section = "SaveData" + string(i);
			var indexReal = i * 4;
			saveInfo[|indexReal] = ini_read_real(section, "Exists", 0);
			saveInfo[|indexReal + 1] = 0; //saveInfo[indexReal + 1] = ini_read_string(section, "Name", "Save file exists but has no name???");
			saveInfo[|indexReal + 2] = ini_read_real(section, "Characters", 0);
			saveInfo[|indexReal + 3] = ini_read_real(section, "Time", 0);
		}
	}
	
	static Update = function() {
		for(var i = 0; i < MAXSAVEFILES; i++) {
			saveInfo[|i * 4 + 1] = clamp(saveInfo[|i * 4 + 1] + ((fileIndex == i) ? 1 : -1), 0, 20);
		}
		if(selectedFile && --savedGameCooldown == 0) {
			if(destination != noone) {
				AssureGameFlag(eFlag.fadeBlack);
				Transition(destination, 99, 0, true);
			} else {
				selectedFile = false;
			}
		}
		if(GetInputPressed(eInput.interact) && !selectedFile) {
			if(saving) { //if trying to save a file
				global.saveFile = fileIndex;
				global.script_variables[? "saveFile"] = fileIndex;
				savedGameCooldown = 120;
				selectedFile = true;
				SaveGame();
				RefreshSaveInfo();
			} else if(saveInfo[|fileIndex * 4]) { //if the save file exists and it's on load mode
				global.saveFile = fileIndex;
				selectedFile = true;
				MANAGER.fadeSpeed = 0.01;
				Sound(sx_level_enter);
				FadeIn();
			} else { //if not in save then play a funny buzzer at you
				Sound(sx_error, 0.9);
			}
		}
		if(selectedFile) {
			if(MANAGER.fadeValue == 1 && !audio_is_playing(sx_level_enter)) {
				//LoadGame loads the game and returns room the player saved in, Transition returns the transition manager object, marker is 99 to force failsafe/default player location
				(Transition(LoadGame(), 9898, 0, true)).fadeBlackInDest = false;
			}
		} else {
			var realFileIndex = nmod(fileIndex + GetInputPressed(eInput.right,true) - GetInputPressed(eInput.left,true), MAXSAVEFILES);
			if(fileIndex != realFileIndex) {
				fileIndex = realFileIndex;
				Sound(sx_title_move);
			}
		}
	}
	
	static Draw = function(alpha) {
		for(var i = 0; i < MAXSAVEFILES; i++) {
			var xx = lerp(48, 320-48, i / (MAXSAVEFILES-1));
			for(var j = saveInfo[|i * 4 + 2]; j >= 1; j--) {
				draw_sprite(s_savefilecharacter, j-1, (xx - 28) + 12 * (j-1), lerp(240-40, 128, saveInfo[|i * 4 + 1] / 20));
				//draw_text(0,0,mouse_x);
			}
			draw_sprite(s_savefilebase, 0, xx, 240 - 40);
			if(fileIndex == i) {
				draw_sprite(s_shop_item, 4, xx - 10, 240 - 140); //draw hand
			}
		}
		var realSaveIndex = fileIndex * 4;
		TextAlignCenter();
		draw_set_font(f_jaxfont);
		DrawTextSimpleShadow(160, 100,
		selectedFile && saving ?
		"FILE SAVED" :
		(saveInfo[|realSaveIndex]
		? "Save file " + string(fileIndex+1) + "\nPlay time: " + TimeToString(saveInfo[|realSaveIndex + 3])
		: (saving ? "New save file" : "No save file")), alpha);
		TextAlignReset();
	}
	
	static Dispose = function() {
		ds_list_destroy(saveInfo);
	}
}