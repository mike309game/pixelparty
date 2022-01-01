//gpu_set_zwriteenable(1);
//gpu_set_ztestenable(1);
//layer_force_draw_depth(1,0);
// Check init_setting for proper vars

global.vars = { // random globals [ USE THIS FOR GLOBAL VARIABLES ]
	playing : sx_nothing,
	play : sx_nothing,
	loopplay : 1,
	roomgo : r_yisify,
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

