//gpu_set_zwriteenable(1);
//gpu_set_ztestenable(1);
//gpu_set_alphatestenable(1); //gamemaker's alpha testing is bipolar and if some object's depth is deemed Funny it'll fuck up everything half opaque
layer_force_draw_depth(1,0);

gml_pragma("UnityBuild", "true");

ini_open(working_directory + "/savedata"); //for settings

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
	eFlag.playerCanSetSprite
);

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
} else if(global.inputMode == 2) {
	var file = get_open_filename_ext("recording|*.pxparec*","",working_directory,"open recording");
	if(file != "") {
		var compressedBuffer = buffer_load(file);
		global.inputBuffer = buffer_decompress(compressedBuffer);
		buffer_seek(global.inputBuffer, buffer_seek_end, 0);
		global.inputBufferSize = buffer_tell(global.inputBuffer);
		buffer_seek(global.inputBuffer, buffer_seek_start, 0); //rewind
		
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

global.pausedsurface = noone;

global.musicMasterVolume = ini_read_real("Volume", "Music", 0.5);
global.soundMasterVolume = ini_read_real("Volume", "Sound", 1);
global.masterVolume = ini_read_real("Volume", "Master", 0.5);

global.musicEmitter = audio_emitter_create();
global.soundEmitter = audio_emitter_create();

global.music = noone; //for usage with manipulating volume and pitch n shit
global.musicTarget = sx_nothing;
global.musicPlaying = sx_nothing;
global.musicLoops = true;

global.vars = { // random globals [ USE THIS FOR GLOBAL VARIABLES ]
	playing : sx_nothing,
	play : sx_nothing,
	loopplay : 1,
	roomgo : r_de_miketest,
	roompt : 0,
	roomtr : 0,
	fakeload : r_yisify,
	ignoreplayer : false,
	got_puzzle : 0,
	puz_pid : -1,
	puz_odd : 0
}
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


global.playerinv = array_create(6,"")
#region font bullshit
globalvar f_boldfelony;
f_boldfelony = font_add_sprite_ext(_f_boldfelony, "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-+", true, 1);
globalvar f_jaxfont;
f_jaxfont = font_add_sprite_ext(_f_jaxfont, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"$%&'(),-./:;<=>?_© ", true, 1);

#endregion