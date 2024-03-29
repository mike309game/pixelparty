randomise();
//gpu_set_zwriteenable(1);
//gpu_set_ztestenable(1);
//gpu_set_alphatestenable(1); //gamemaker's alpha testing is bipolar and if some object's depth is deemed Funny it'll fuck up everything half opaque
layer_force_draw_depth(1,0);

gml_pragma("UnityBuild", "true");

ini_open(working_directory + "/savedata"); //for settings

#macro START_ROOM r_de_test
#macro release:START_ROOM (r_titlecards)

//if in release mode, make it always false, this will make all debug checks be removed from code because gamemaker removes absolutely unreachable code
//if not in release mode, make it go check the actual flag

#macro DEBUGMODE (global.flag & eFlag.debugEnabled)
#macro release:DEBUGMODE (false)

#macro MAXSAVEFILES (4)

//#macro MAXINPUTDELAYFRAMES (120)

/*

whenever this gets intensive, completely null the macro and create another and use the new one
after
idk how to explain you don't need to do anything base

*/

#macro EVTLIVE if (live_call() && os_type == os_windows) return live_result;
#macro release:EVTLIVE

enum eFlag {
	playerCanMove = 1 << 0,
	stopAll = 1 << 1, //stop what can be stopped
	autoStopPlayer = 1 << 2, //auto stop player when interacting with shit
	playerCanInteract = 1 << 3, 
	doFadeIn = 1 << 4, //if on, will start blanking out screen
	fadeBlack = 1 << 5, //if fade will darken screen
	playerCanTransition = 1 << 6, //touching transition triggers can start the transition?
	playerCanCollide = 1 << 7, //solid blocks will stop player?
	cameraFocusOnPlayer = 1 << 8, //camera centers on player?
	playerCanSetSprite = 1 << 9, //player can set its sprite automatically?
	playerCanSetDepth = 1 << 10, //player automatically sets its depth based on its y
	
	debugEnabled = 0 << 61, //wether debug features are enabled
	showPerfMeter = 1 << 62, //show p3d school performance meter
	saveCorrupted = 1 << 63 //this will only be on when the game fails to load a save file somehow
}

global.flag = (
	eFlag.playerCanMove |
	eFlag.playerCanInteract |
	eFlag.autoStopPlayer |
	//eFlag.fadeBlack |
	eFlag.playerCanTransition |
	eFlag.playerCanCollide |
	eFlag.cameraFocusOnPlayer |
	eFlag.playerCanSetSprite |
	eFlag.playerCanSetDepth |
	eFlag.debugEnabled |
	eFlag.showPerfMeter
);

if(DEBUGMODE) {
	global.flagDefs = array_create(64, "unused");
	global.flagDefs[0] = "playerCanMove";
	global.flagDefs[1] = "stopAll";
	global.flagDefs[2] = "autoStopPlayer";
	global.flagDefs[3] = "playerCanInteract";
	global.flagDefs[4] = "doFadeIn";
	global.flagDefs[5] = "fadeBlack";
	global.flagDefs[6] = "playerCanTransition";
	global.flagDefs[7] = "playerCanCollide";
	global.flagDefs[8] = "cameraFocusOnPlayer";
	global.flagDefs[9] = "playerCanSetSprite";
	global.flagDefs[10] = "playerCanSetDepth";
	
	global.flagDefs[61] = "debugEnabled";
	global.flagDefs[62] = "showPerfMeter";
	global.flagDefs[63] = "saveCorrupted";
}

global.mainCamera = camera_create_view(0,0,320,240);

global.input = int64(0);
global.inputPressed = int64(0);
global.inputReleased = int64(0);

global.inputFrozen = int64(0);
global.inputAllowed = int64(-1);

global.inputMode = 1 * file_exists("RECORD.txt") + (2 * file_exists("PLAYBACK.txt"));
global.inputBuffer = -1;
global.inputBufferSize = 0;

if(global.inputMode == 1) {
	global.inputBuffer = buffer_create(1,buffer_grow,1);
	buffer_write(global.inputBuffer, buffer_f64, random_get_seed()); //write rng
	global.inputBufferSize += 8; //rng is 8 bytes
} else if(global.inputMode == 2) {
	var file = get_open_filename_ext("recording|*.pxparec*","",working_directory,"open recording");
	if(file != "") {
		var compressedBuffer = buffer_load(file);
		global.inputBuffer = buffer_decompress(compressedBuffer);
		buffer_seek(global.inputBuffer, buffer_seek_end, 0);
		global.inputBufferSize = buffer_tell(global.inputBuffer);
		buffer_seek(global.inputBuffer, buffer_seek_start, 0); //rewind
		random_set_seed(buffer_read(global.inputBuffer, buffer_f64)); //get recording rng
		
		buffer_delete(compressedBuffer);
	}
}

// Check init_setting for proper vars

application_surface_draw_enable(0);
//shader_set(shPassthrough);

//gpu_set_blendmode_ext(bm_src_alpha, bm_inv_dest_alpha);

global.time = 0;

global.camX = 0;
global.camY = 0;

global.windowWidth = 320;
global.windowHeight = 240;
global.windowCenterX = 160;
global.windowCenterY = 120;
global.gameSurfaceScale = 1;

global.pausedsurface = noone;

global.saveFile = 0;

global.gameScale = ini_read_real("Etc", "WindowScale", 3);
global.musicMasterVolume = ini_read_real("Volume", "Music", 0.5);
global.soundMasterVolume = ini_read_real("Volume", "Sound", 1);
global.masterVolume = ini_read_real("Volume", "Master", 0.5);

global.musicEmitter = audio_emitter_create();
global.soundEmitter = audio_emitter_create();

global.music = noone; //for usage with manipulating volume and pitch n shit
global.musicTarget = sx_nothing;
global.musicPlaying = sx_nothing;
global.musicLoops = true;
	
#region old
/*
global.player = { // player globals [ PUT PLAYER GLOBALS HERE ]
	move : 1,
	area : "bright",
	puzzle : 0,
	money : 0,
	dir : 0,
	bootlvl : 0,
	lastoffset : 4,
	no_cam : 0
}

global.catparts = // level 1 part collection
	{
		part : [0,0,0]
	}
global.gates = // puzzle gates
	{
		gate : [0,0]
	}

#region outdated
/*
global.shop_start_tables =
	{
		l1 : ["wheat","s_boots1","odd_key"],
		l2 : ["nothing","nothing","nothing"],
		l3 : ["nothing","nothing","nothing"]
	}

global.shop_item_price = ds_map_create()
global.shop_item_price[? "nothing"] = -1
global.shop_item_price[? "wheat"] = 0
global.shop_item_price[? "s_boots1"] = 15
global.shop_item_price[? "odd_key"] = 30
global.shop_item_price[? "good_time"] = 100

global.shop_item_name = ds_map_create()
global.shop_item_name[? "nothing"] = "Sold Out!"
global.shop_item_name[? "wheat"] = "Wheat"
global.shop_item_name[? "s_boots1"] = "S.Boots I"
global.shop_item_name[? "odd_key"] = "Odd Key"
global.shop_item_name[? "good_time"] = "Good Time"



global.gameevent = ds_map_create()
global.gameevent[? "de_e1"] = 0
global.gameevent[? "h1_e1"] = 0
global.gameevent[? "h2_e1"] = 0
global.gameevent[? "shopfirst"] = 0
global.gameevent[? "l1_e1"] = 0
global.gameevent[? "l1_e2"] = 0
global.gameevent[? "l1_e3"] = 0
global.gameevent[? "l2_e1"] = 0
global.gameevent[? "l3_e1"] = 0
global.gameevent[? "l3_e2"] = 0

// level signs
global.gameevent[? "l1_e0"] = 0
global.gameevent[? "l2_e0"] = 0
global.gameevent[? "l3_e0"] = 0

// melvin
global.gameevent[? "mev_1"] = 0
*/
#endregion

#region font bullshit
globalvar f_boldfelony;
f_boldfelony = font_add_sprite_ext(_f_boldfelony, "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-+", true, 1);
globalvar f_jaxfont;
f_jaxfont = font_add_sprite_ext(_f_jaxfont, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"$%&'(),-./:;<=>?_©* ", true, 1);

#endregion

global.pickupInv = ds_list_create() 

