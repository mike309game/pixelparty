//gpu_set_zwriteenable(1);
//gpu_set_ztestenable(1);
//gpu_set_alphatestenable(1); //gamemaker's alpha testing is bipolar and if some object's depth is deemed Funny it'll fuck up everything half opaque
layer_force_draw_depth(1,0);
// Check init_setting for proper vars

application_surface_draw_enable(0);

//gpu_set_blendmode_ext(bm_src_alpha, bm_inv_dest_alpha);

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
	puz_pid : -1
}
global.player = {
	move : 1,
	area : "bright",
	puzzle : 0,
	money : 0,
	bootlvl : 0
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
global.gameevent[? "l2_e1"] = 0


global.playerinv = array_create(6,"")

#region JaxFont maps
global.JaxFont_offsets = ds_map_create();
global.JaxFont_widths = ds_map_create();

global.JaxFont_offsets[?97]=0;
global.JaxFont_widths[?97]=6;
global.JaxFont_offsets[?98]=0;
global.JaxFont_widths[?98]=6;
global.JaxFont_offsets[?99]=0;
global.JaxFont_widths[?99]=6;
global.JaxFont_offsets[?100]=0;
global.JaxFont_widths[?100]=6;
global.JaxFont_offsets[?101]=0;
global.JaxFont_widths[?101]=6;
global.JaxFont_offsets[?102]=0;
global.JaxFont_widths[?102]=6;
global.JaxFont_offsets[?103]=0;
global.JaxFont_widths[?103]=6;
global.JaxFont_offsets[?104]=0;
global.JaxFont_widths[?104]=6;
global.JaxFont_offsets[?105]=3;
global.JaxFont_widths[?105]=1;
global.JaxFont_offsets[?106]=0;
global.JaxFont_widths[?106]=2;
global.JaxFont_offsets[?107]=0;
global.JaxFont_widths[?107]=6;
global.JaxFont_offsets[?108]=3;
global.JaxFont_widths[?108]=1;
global.JaxFont_offsets[?109]=0;
global.JaxFont_widths[?109]=6;
global.JaxFont_offsets[?110]=0;
global.JaxFont_widths[?110]=6;
global.JaxFont_offsets[?111]=0;
global.JaxFont_widths[?111]=6;
global.JaxFont_offsets[?112]=0;
global.JaxFont_widths[?112]=6;
global.JaxFont_offsets[?113]=0;
global.JaxFont_widths[?113]=6;
global.JaxFont_offsets[?114]=0;
global.JaxFont_widths[?114]=6;
global.JaxFont_offsets[?115]=0;
global.JaxFont_widths[?115]=6;
global.JaxFont_offsets[?116]=0;
global.JaxFont_widths[?116]=5;
global.JaxFont_offsets[?117]=0;
global.JaxFont_widths[?117]=6;
global.JaxFont_offsets[?118]=0;
global.JaxFont_widths[?118]=6;
global.JaxFont_offsets[?119]=0;
global.JaxFont_widths[?119]=6;
global.JaxFont_offsets[?120]=0;
global.JaxFont_widths[?120]=6;
global.JaxFont_offsets[?121]=0;
global.JaxFont_widths[?121]=6;
global.JaxFont_offsets[?122]=0;
global.JaxFont_widths[?122]=6;
global.JaxFont_offsets[?65]=0;
global.JaxFont_widths[?65]=6;
global.JaxFont_offsets[?66]=0;
global.JaxFont_widths[?66]=6;
global.JaxFont_offsets[?67]=0;
global.JaxFont_widths[?67]=6;
global.JaxFont_offsets[?68]=0;
global.JaxFont_widths[?68]=6;
global.JaxFont_offsets[?69]=0;
global.JaxFont_widths[?69]=6;
global.JaxFont_offsets[?70]=0;
global.JaxFont_widths[?70]=6;
global.JaxFont_offsets[?71]=0;
global.JaxFont_widths[?71]=6;
global.JaxFont_offsets[?72]=0;
global.JaxFont_widths[?72]=6;
global.JaxFont_offsets[?73]=0;
global.JaxFont_widths[?73]=6;
global.JaxFont_offsets[?74]=0;
global.JaxFont_widths[?74]=6;
global.JaxFont_offsets[?75]=0;
global.JaxFont_widths[?75]=6;
global.JaxFont_offsets[?76]=0;
global.JaxFont_widths[?76]=6;
global.JaxFont_offsets[?77]=0;
global.JaxFont_widths[?77]=6;
global.JaxFont_offsets[?78]=0;
global.JaxFont_widths[?78]=6;
global.JaxFont_offsets[?79]=0;
global.JaxFont_widths[?79]=6;
global.JaxFont_offsets[?80]=0;
global.JaxFont_widths[?80]=6;
global.JaxFont_offsets[?81]=0;
global.JaxFont_widths[?81]=6;
global.JaxFont_offsets[?82]=0;
global.JaxFont_widths[?82]=6;
global.JaxFont_offsets[?83]=0;
global.JaxFont_widths[?83]=6;
global.JaxFont_offsets[?84]=0;
global.JaxFont_widths[?84]=6;
global.JaxFont_offsets[?85]=0;
global.JaxFont_widths[?85]=6;
global.JaxFont_offsets[?86]=0;
global.JaxFont_widths[?86]=6;
global.JaxFont_offsets[?87]=0;
global.JaxFont_widths[?87]=6;
global.JaxFont_offsets[?88]=0;
global.JaxFont_widths[?88]=6;
global.JaxFont_offsets[?89]=0;
global.JaxFont_widths[?89]=6;
global.JaxFont_offsets[?90]=0;
global.JaxFont_widths[?90]=6;
global.JaxFont_offsets[?48]=0;
global.JaxFont_widths[?48]=6;
global.JaxFont_offsets[?49]=0;
global.JaxFont_widths[?49]=4;
global.JaxFont_offsets[?50]=0;
global.JaxFont_widths[?50]=6;
global.JaxFont_offsets[?51]=0;
global.JaxFont_widths[?51]=6;
global.JaxFont_offsets[?52]=0;
global.JaxFont_widths[?52]=6;
global.JaxFont_offsets[?53]=0;
global.JaxFont_widths[?53]=6;
global.JaxFont_offsets[?54]=0;
global.JaxFont_widths[?54]=6;
global.JaxFont_offsets[?55]=0;
global.JaxFont_widths[?55]=6;
global.JaxFont_offsets[?56]=0;
global.JaxFont_widths[?56]=6;
global.JaxFont_offsets[?57]=0;
global.JaxFont_widths[?57]=6;
global.JaxFont_offsets[?33]=1;
global.JaxFont_widths[?33]=3;
global.JaxFont_offsets[?34]=1;
global.JaxFont_widths[?34]=1;
global.JaxFont_offsets[?36]=0;
global.JaxFont_widths[?36]=6;
global.JaxFont_offsets[?37]=0;
global.JaxFont_widths[?37]=7;
global.JaxFont_offsets[?39]=1;
global.JaxFont_widths[?39]=1;
global.JaxFont_offsets[?40]=0;
global.JaxFont_widths[?40]=3;
global.JaxFont_offsets[?41]=0;
global.JaxFont_widths[?41]=3;
global.JaxFont_offsets[?44]=1;
global.JaxFont_widths[?44]=2;
global.JaxFont_offsets[?45]=1;
global.JaxFont_widths[?45]=4;
global.JaxFont_offsets[?46]=1;
global.JaxFont_widths[?46]=2;
global.JaxFont_offsets[?47]=1;
global.JaxFont_widths[?47]=4;
global.JaxFont_offsets[?58]=1;
global.JaxFont_widths[?58]=1;
global.JaxFont_offsets[?59]=1;
global.JaxFont_widths[?59]=2;
global.JaxFont_offsets[?60]=0;
global.JaxFont_widths[?60]=8;
global.JaxFont_offsets[?61]=0;
global.JaxFont_widths[?61]=8;
global.JaxFont_offsets[?62]=0;
global.JaxFont_widths[?62]=8;
global.JaxFont_offsets[?63]=0;
global.JaxFont_widths[?63]=6;
global.JaxFont_offsets[?95]=0;
global.JaxFont_widths[?95]=9;
global.JaxFont_offsets[?169]=3;
global.JaxFont_widths[?169]=9;
#endregion