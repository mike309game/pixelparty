gml_pragma("global","init()");
display_set_gui_size(320,240)

global.debug = {
	debug_enabled : 1,
	noclip : 0,
	auto_puzzle : 0
}

global.setting = {
	sound : 100,
	music : 100,
	lang : "eng"
}

global.vars = {
	playing : sx_nothing,
	play : sx_nothing,
	loopplay : 1,
	roomgo : r_yisify,
	roompt : 0,
	roomtr : 0,
	fakeload : r_yisify,
	ignoreplayer : false
}

global.player = {
	move : 1,
	area : "bright"
}

global.event = {
	hon1 : 0,
	hon2 : 0,
	lev1 : 0,
	lev2 : 0,
	lev3 : 0
}