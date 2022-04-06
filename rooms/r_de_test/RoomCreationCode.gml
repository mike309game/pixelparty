Music(sx_nothing);
SetGameFlag(eFlag.playerCanCollide,1)
SetGameFlag(eFlag.playerCanMove,1)
SetGameFlag(eFlag.playerCanInteract,1)
SetGameFlag(eFlag.playerCanTransition,1)

/*var int = instance_create_depth(0,0,-999999999,ScriptSectionInterpreter);
with(int) {
	section = global.script_sections[? "handler test"];
	sectionName = "handler test";
	/*myHandler = instance_create_depth(0,0,-99999,ScriptNormalDialogueHandler);
	myHandler.myInterpreter = id;*
	myHandler = new HandlerCommon(id);
}*/

//random femboy event
var lyr = layer_get_id("Assets_1");
if(irandom_range(0,34532) == 69) {
	layer_set_visible(lyr,true);
}



/*repeat(20) {
	instance_create_depth(800/2, 600/2, 0, obj_perlintest);
}

for(var i = 21; i > 0; i--) {
	with(instance_create_depth(0, 0, 0, obj_perlintest)) {
		specialdepth = i/4;
	}
}*/

/*var _fx_tint = fx_create("_filter_tintfilter");
show_message(_fx_tint);
fx_set_parameter(_fx_tint, "g_TintCol", [1, 0, 0, 1]);
layer_set_fx(layer_create(0), _fx_tint);*/