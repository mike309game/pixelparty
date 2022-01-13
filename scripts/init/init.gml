//gpu_set_zwriteenable(1);
//gpu_set_ztestenable(1);
//gpu_set_alphatestenable(1); //gamemaker's alpha testing is bipolar and if some object's depth is deemed Funny it'll fuck up everything half opaque
layer_force_draw_depth(1,0);

gml_pragma("UnityBuild", "true");

enum eFlag {
	playerCanMove = 1 << 0,
	stopAll = 1 << 1, //stop what can be stopped
	autoStopPlayer = 1 << 2, //auto stop player when interacting with shit
	playerCanInteract = 1 << 3, 
	doFadeIn = 1 << 4, //if on, will start blanking out screen
	fadeBlack = 1 << 5, //if fade will darken screen
	playerCanTransition = 1 << 6, //touching transition triggers can start the transition?
	playerCanCollide = 1 << 7, //solid blocks will stop player?
}

global.flag = (
	eFlag.playerCanMove |
	eFlag.playerCanInteract |
	eFlag.autoStopPlayer |
	eFlag.fadeBlack |
	eFlag.playerCanTransition |
	eFlag.playerCanCollide
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

global.guisurface = noone;
global.pausedsurface = noone;

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

#region JaxFont maps
global.JaxLarge_offsets = ds_map_create();
global.JaxLarge_widths = ds_map_create();

global.JaxLarge_offsets[?"a"]=0;
global.JaxLarge_widths[?"a"]=6;
global.JaxLarge_offsets[?"b"]=0;
global.JaxLarge_widths[?"b"]=6;
global.JaxLarge_offsets[?"c"]=0;
global.JaxLarge_widths[?"c"]=6;
global.JaxLarge_offsets[?"d"]=0;
global.JaxLarge_widths[?"d"]=6;
global.JaxLarge_offsets[?"e"]=0;
global.JaxLarge_widths[?"e"]=6;
global.JaxLarge_offsets[?"f"]=0;
global.JaxLarge_widths[?"f"]=6;
global.JaxLarge_offsets[?"g"]=0;
global.JaxLarge_widths[?"g"]=6;
global.JaxLarge_offsets[?"h"]=0;
global.JaxLarge_widths[?"h"]=6;
global.JaxLarge_offsets[?"i"]=3;
global.JaxLarge_widths[?"i"]=1;
global.JaxLarge_offsets[?"j"]=0;
global.JaxLarge_widths[?"j"]=2;
global.JaxLarge_offsets[?"k"]=0;
global.JaxLarge_widths[?"k"]=6;
global.JaxLarge_offsets[?"l"]=3;
global.JaxLarge_widths[?"l"]=1;
global.JaxLarge_offsets[?"m"]=0;
global.JaxLarge_widths[?"m"]=6;
global.JaxLarge_offsets[?"n"]=0;
global.JaxLarge_widths[?"n"]=6;
global.JaxLarge_offsets[?"o"]=0;
global.JaxLarge_widths[?"o"]=6;
global.JaxLarge_offsets[?"p"]=0;
global.JaxLarge_widths[?"p"]=6;
global.JaxLarge_offsets[?"q"]=0;
global.JaxLarge_widths[?"q"]=6;
global.JaxLarge_offsets[?"r"]=0;
global.JaxLarge_widths[?"r"]=6;
global.JaxLarge_offsets[?"s"]=0;
global.JaxLarge_widths[?"s"]=6;
global.JaxLarge_offsets[?"t"]=0;
global.JaxLarge_widths[?"t"]=5;
global.JaxLarge_offsets[?"u"]=0;
global.JaxLarge_widths[?"u"]=6;
global.JaxLarge_offsets[?"v"]=0;
global.JaxLarge_widths[?"v"]=6;
global.JaxLarge_offsets[?"w"]=0;
global.JaxLarge_widths[?"w"]=6;
global.JaxLarge_offsets[?"x"]=0;
global.JaxLarge_widths[?"x"]=6;
global.JaxLarge_offsets[?"y"]=0;
global.JaxLarge_widths[?"y"]=6;
global.JaxLarge_offsets[?"z"]=0;
global.JaxLarge_widths[?"z"]=6;
global.JaxLarge_offsets[?"A"]=0;
global.JaxLarge_widths[?"A"]=6;
global.JaxLarge_offsets[?"B"]=0;
global.JaxLarge_widths[?"B"]=6;
global.JaxLarge_offsets[?"C"]=0;
global.JaxLarge_widths[?"C"]=6;
global.JaxLarge_offsets[?"D"]=0;
global.JaxLarge_widths[?"D"]=6;
global.JaxLarge_offsets[?"E"]=0;
global.JaxLarge_widths[?"E"]=6;
global.JaxLarge_offsets[?"F"]=0;
global.JaxLarge_widths[?"F"]=6;
global.JaxLarge_offsets[?"G"]=0;
global.JaxLarge_widths[?"G"]=6;
global.JaxLarge_offsets[?"H"]=0;
global.JaxLarge_widths[?"H"]=6;
global.JaxLarge_offsets[?"I"]=0;
global.JaxLarge_widths[?"I"]=6;
global.JaxLarge_offsets[?"J"]=0;
global.JaxLarge_widths[?"J"]=6;
global.JaxLarge_offsets[?"K"]=0;
global.JaxLarge_widths[?"K"]=6;
global.JaxLarge_offsets[?"L"]=0;
global.JaxLarge_widths[?"L"]=6;
global.JaxLarge_offsets[?"M"]=0;
global.JaxLarge_widths[?"M"]=6;
global.JaxLarge_offsets[?"N"]=0;
global.JaxLarge_widths[?"N"]=6;
global.JaxLarge_offsets[?"O"]=0;
global.JaxLarge_widths[?"O"]=6;
global.JaxLarge_offsets[?"P"]=0;
global.JaxLarge_widths[?"P"]=6;
global.JaxLarge_offsets[?"Q"]=0;
global.JaxLarge_widths[?"Q"]=6;
global.JaxLarge_offsets[?"R"]=0;
global.JaxLarge_widths[?"R"]=6;
global.JaxLarge_offsets[?"S"]=0;
global.JaxLarge_widths[?"S"]=6;
global.JaxLarge_offsets[?"T"]=0;
global.JaxLarge_widths[?"T"]=6;
global.JaxLarge_offsets[?"U"]=0;
global.JaxLarge_widths[?"U"]=6;
global.JaxLarge_offsets[?"V"]=0;
global.JaxLarge_widths[?"V"]=6;
global.JaxLarge_offsets[?"W"]=0;
global.JaxLarge_widths[?"W"]=6;
global.JaxLarge_offsets[?"X"]=0;
global.JaxLarge_widths[?"X"]=6;
global.JaxLarge_offsets[?"Y"]=0;
global.JaxLarge_widths[?"Y"]=6;
global.JaxLarge_offsets[?"Z"]=0;
global.JaxLarge_widths[?"Z"]=6;
global.JaxLarge_offsets[?"0"]=0;
global.JaxLarge_widths[?"0"]=6;
global.JaxLarge_offsets[?"1"]=0;
global.JaxLarge_widths[?"1"]=4;
global.JaxLarge_offsets[?"2"]=0;
global.JaxLarge_widths[?"2"]=6;
global.JaxLarge_offsets[?"3"]=0;
global.JaxLarge_widths[?"3"]=6;
global.JaxLarge_offsets[?"4"]=0;
global.JaxLarge_widths[?"4"]=6;
global.JaxLarge_offsets[?"5"]=0;
global.JaxLarge_widths[?"5"]=6;
global.JaxLarge_offsets[?"6"]=0;
global.JaxLarge_widths[?"6"]=6;
global.JaxLarge_offsets[?"7"]=0;
global.JaxLarge_widths[?"7"]=6;
global.JaxLarge_offsets[?"8"]=0;
global.JaxLarge_widths[?"8"]=6;
global.JaxLarge_offsets[?"9"]=0;
global.JaxLarge_widths[?"9"]=6;
global.JaxLarge_offsets[?"!"]=1;
global.JaxLarge_widths[?"!"]=3;
global.JaxLarge_offsets[?"\""]=1;
global.JaxLarge_widths[?"\""]=1;
global.JaxLarge_offsets[?"$"]=0;
global.JaxLarge_widths[?"$"]=6;
global.JaxLarge_offsets[?"%"]=0;
global.JaxLarge_widths[?"%"]=7;
global.JaxLarge_offsets[?"'"]=1;
global.JaxLarge_widths[?"'"]=1;
global.JaxLarge_offsets[?"("]=0;
global.JaxLarge_widths[?"("]=3;
global.JaxLarge_offsets[?")"]=0;
global.JaxLarge_widths[?")"]=3;
global.JaxLarge_offsets[?","]=1;
global.JaxLarge_widths[?","]=2;
global.JaxLarge_offsets[?"-"]=1;
global.JaxLarge_widths[?"-"]=4;
global.JaxLarge_offsets[?"."]=1;
global.JaxLarge_widths[?"."]=2;
global.JaxLarge_offsets[?"/"]=1;
global.JaxLarge_widths[?"/"]=4;
global.JaxLarge_offsets[?":"]=1;
global.JaxLarge_widths[?":"]=1;
global.JaxLarge_offsets[?";"]=1;
global.JaxLarge_widths[?";"]=2;
global.JaxLarge_offsets[?"<"]=0;
global.JaxLarge_widths[?"<"]=8;
global.JaxLarge_offsets[?"="]=0;
global.JaxLarge_widths[?"="]=8;
global.JaxLarge_offsets[?">"]=0;
global.JaxLarge_widths[?">"]=8;
global.JaxLarge_offsets[?"?"]=0;
global.JaxLarge_widths[?"?"]=6;
global.JaxLarge_offsets[?"_"]=0;
global.JaxLarge_widths[?"_"]=9;
global.JaxLarge_offsets[?"©"]=3;
global.JaxLarge_widths[?"©"]=9;
global.JaxLarge_offsets[?"\\"]=2;
global.JaxLarge_widths[?"\\"]=6;
global.JaxLarge_offsets[?"["]=3;
global.JaxLarge_widths[?"["]=4;
global.JaxLarge_offsets[?"]"]=2;
global.JaxLarge_widths[?"]"]=4;
global.JaxLarge_offsets[?"~"]=1;
global.JaxLarge_widths[?"~"]=7;
global.JaxLarge_offsets[?"#"]=0;
global.JaxLarge_widths[?"#"]=9;
#endregion