function DebugWatchVars(x,y,vars){
	//show_message("script " + string(id));
	gml_pragma("forceinline");
	draw_set_font(fntSmall);
	var info = "";
	var len = array_length(vars);
	for(var i = 0; i < len; i++) {
		info += vars[i] + " " + string(variable_instance_get(id, vars[i])) + "\n";
	}
	draw_text(x,y,info);
}