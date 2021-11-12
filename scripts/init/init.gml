//gpu_set_zwriteenable(1);
//gpu_set_ztestenable(1);
//gpu_set_alphatestenable(1); //gamemaker's alpha testing is bipolar and if some object's depth is deemed Funny it'll fuck up everything half opaque
layer_force_draw_depth(1,0);
// Check init_setting for proper vars

application_surface_draw_enable(0);

//gpu_set_blendmode_ext(bm_src_alpha, bm_inv_dest_alpha);

global.time = 0;

global.guisurface = noone;
global.pausedsurface = noone;

global.vars = {
	playing : sx_nothing,
	play : sx_nothing,
	loopplay : 1,
	roomgo : r_de_test,
	roompt : 0,
	roomtr : 0,
	fakeload : r_yisify,
	ignoreplayer : false,
	got_puzzle : 0,
	puz_pid : -1,
	puz_odd : 0
}
global.player = {
	move : 1,
	area : "bright",
	puzzle : 0,
	money : 0,
	dir : 0,
	bootlvl : 0,
	lastoffset : 1
}

global.catparts =
	{
		part : [0,0,0]
	}
global.shop_start_tables =
	{
		l1 : ["wheat","s_boots1","odd_key"],
		l2 : ["nothing","nothing","nothing"]
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
global.gameevent[? "shopfirst"] = 1
global.gameevent[? "l1_e1"] = 0
global.gameevent[? "l1_e2"] = 0
global.gameevent[? "l1_e3"] = 0
global.gameevent[? "l2_e1"] = 0


global.playerinv = array_create(6,"")

#region JaxFont maps
global.JaxFont_offsets = ds_map_create();
global.JaxFont_widths = ds_map_create();

global.JaxFont_offsets[?"a"]=0;
global.JaxFont_widths[?"a"]=6;
global.JaxFont_offsets[?"b"]=0;
global.JaxFont_widths[?"b"]=6;
global.JaxFont_offsets[?"c"]=0;
global.JaxFont_widths[?"c"]=6;
global.JaxFont_offsets[?"d"]=0;
global.JaxFont_widths[?"d"]=6;
global.JaxFont_offsets[?"e"]=0;
global.JaxFont_widths[?"e"]=6;
global.JaxFont_offsets[?"f"]=0;
global.JaxFont_widths[?"f"]=6;
global.JaxFont_offsets[?"g"]=0;
global.JaxFont_widths[?"g"]=6;
global.JaxFont_offsets[?"h"]=0;
global.JaxFont_widths[?"h"]=6;
global.JaxFont_offsets[?"i"]=3;
global.JaxFont_widths[?"i"]=1;
global.JaxFont_offsets[?"j"]=0;
global.JaxFont_widths[?"j"]=2;
global.JaxFont_offsets[?"k"]=0;
global.JaxFont_widths[?"k"]=6;
global.JaxFont_offsets[?"l"]=3;
global.JaxFont_widths[?"l"]=1;
global.JaxFont_offsets[?"m"]=0;
global.JaxFont_widths[?"m"]=6;
global.JaxFont_offsets[?"n"]=0;
global.JaxFont_widths[?"n"]=6;
global.JaxFont_offsets[?"o"]=0;
global.JaxFont_widths[?"o"]=6;
global.JaxFont_offsets[?"p"]=0;
global.JaxFont_widths[?"p"]=6;
global.JaxFont_offsets[?"q"]=0;
global.JaxFont_widths[?"q"]=6;
global.JaxFont_offsets[?"r"]=0;
global.JaxFont_widths[?"r"]=6;
global.JaxFont_offsets[?"s"]=0;
global.JaxFont_widths[?"s"]=6;
global.JaxFont_offsets[?"t"]=0;
global.JaxFont_widths[?"t"]=5;
global.JaxFont_offsets[?"u"]=0;
global.JaxFont_widths[?"u"]=6;
global.JaxFont_offsets[?"v"]=0;
global.JaxFont_widths[?"v"]=6;
global.JaxFont_offsets[?"w"]=0;
global.JaxFont_widths[?"w"]=6;
global.JaxFont_offsets[?"x"]=0;
global.JaxFont_widths[?"x"]=6;
global.JaxFont_offsets[?"y"]=0;
global.JaxFont_widths[?"y"]=6;
global.JaxFont_offsets[?"z"]=0;
global.JaxFont_widths[?"z"]=6;
global.JaxFont_offsets[?"A"]=0;
global.JaxFont_widths[?"A"]=6;
global.JaxFont_offsets[?"B"]=0;
global.JaxFont_widths[?"B"]=6;
global.JaxFont_offsets[?"C"]=0;
global.JaxFont_widths[?"C"]=6;
global.JaxFont_offsets[?"D"]=0;
global.JaxFont_widths[?"D"]=6;
global.JaxFont_offsets[?"E"]=0;
global.JaxFont_widths[?"E"]=6;
global.JaxFont_offsets[?"F"]=0;
global.JaxFont_widths[?"F"]=6;
global.JaxFont_offsets[?"G"]=0;
global.JaxFont_widths[?"G"]=6;
global.JaxFont_offsets[?"H"]=0;
global.JaxFont_widths[?"H"]=6;
global.JaxFont_offsets[?"I"]=0;
global.JaxFont_widths[?"I"]=6;
global.JaxFont_offsets[?"J"]=0;
global.JaxFont_widths[?"J"]=6;
global.JaxFont_offsets[?"K"]=0;
global.JaxFont_widths[?"K"]=6;
global.JaxFont_offsets[?"L"]=0;
global.JaxFont_widths[?"L"]=6;
global.JaxFont_offsets[?"M"]=0;
global.JaxFont_widths[?"M"]=6;
global.JaxFont_offsets[?"N"]=0;
global.JaxFont_widths[?"N"]=6;
global.JaxFont_offsets[?"O"]=0;
global.JaxFont_widths[?"O"]=6;
global.JaxFont_offsets[?"P"]=0;
global.JaxFont_widths[?"P"]=6;
global.JaxFont_offsets[?"Q"]=0;
global.JaxFont_widths[?"Q"]=6;
global.JaxFont_offsets[?"R"]=0;
global.JaxFont_widths[?"R"]=6;
global.JaxFont_offsets[?"S"]=0;
global.JaxFont_widths[?"S"]=6;
global.JaxFont_offsets[?"T"]=0;
global.JaxFont_widths[?"T"]=6;
global.JaxFont_offsets[?"U"]=0;
global.JaxFont_widths[?"U"]=6;
global.JaxFont_offsets[?"V"]=0;
global.JaxFont_widths[?"V"]=6;
global.JaxFont_offsets[?"W"]=0;
global.JaxFont_widths[?"W"]=6;
global.JaxFont_offsets[?"X"]=0;
global.JaxFont_widths[?"X"]=6;
global.JaxFont_offsets[?"Y"]=0;
global.JaxFont_widths[?"Y"]=6;
global.JaxFont_offsets[?"Z"]=0;
global.JaxFont_widths[?"Z"]=6;
global.JaxFont_offsets[?"0"]=0;
global.JaxFont_widths[?"0"]=6;
global.JaxFont_offsets[?"1"]=0;
global.JaxFont_widths[?"1"]=4;
global.JaxFont_offsets[?"2"]=0;
global.JaxFont_widths[?"2"]=6;
global.JaxFont_offsets[?"3"]=0;
global.JaxFont_widths[?"3"]=6;
global.JaxFont_offsets[?"4"]=0;
global.JaxFont_widths[?"4"]=6;
global.JaxFont_offsets[?"5"]=0;
global.JaxFont_widths[?"5"]=6;
global.JaxFont_offsets[?"6"]=0;
global.JaxFont_widths[?"6"]=6;
global.JaxFont_offsets[?"7"]=0;
global.JaxFont_widths[?"7"]=6;
global.JaxFont_offsets[?"8"]=0;
global.JaxFont_widths[?"8"]=6;
global.JaxFont_offsets[?"9"]=0;
global.JaxFont_widths[?"9"]=6;
global.JaxFont_offsets[?"!"]=1;
global.JaxFont_widths[?"!"]=3;
global.JaxFont_offsets[?"\""]=1;
global.JaxFont_widths[?"\""]=1;
global.JaxFont_offsets[?"$"]=0;
global.JaxFont_widths[?"$"]=6;
global.JaxFont_offsets[?"%"]=0;
global.JaxFont_widths[?"%"]=7;
global.JaxFont_offsets[?"'"]=1;
global.JaxFont_widths[?"'"]=1;
global.JaxFont_offsets[?"("]=0;
global.JaxFont_widths[?"("]=3;
global.JaxFont_offsets[?")"]=0;
global.JaxFont_widths[?")"]=3;
global.JaxFont_offsets[?","]=1;
global.JaxFont_widths[?","]=2;
global.JaxFont_offsets[?"-"]=1;
global.JaxFont_widths[?"-"]=4;
global.JaxFont_offsets[?"."]=1;
global.JaxFont_widths[?"."]=2;
global.JaxFont_offsets[?"/"]=1;
global.JaxFont_widths[?"/"]=4;
global.JaxFont_offsets[?":"]=1;
global.JaxFont_widths[?":"]=1;
global.JaxFont_offsets[?";"]=1;
global.JaxFont_widths[?";"]=2;
global.JaxFont_offsets[?"<"]=0;
global.JaxFont_widths[?"<"]=8;
global.JaxFont_offsets[?"="]=0;
global.JaxFont_widths[?"="]=8;
global.JaxFont_offsets[?">"]=0;
global.JaxFont_widths[?">"]=8;
global.JaxFont_offsets[?"?"]=0;
global.JaxFont_widths[?"?"]=6;
global.JaxFont_offsets[?"_"]=0;
global.JaxFont_widths[?"_"]=9;
global.JaxFont_offsets[?"©"]=3;
global.JaxFont_widths[?"©"]=9;
#endregion