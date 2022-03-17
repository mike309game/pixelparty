function ResetScriptVariables(){
	gml_pragma("forceinline");
	ds_map_read(global.script_variables, global.scriptVariablesInitial); //gamemaker manual says this will clear then load
	global.time = 0;
}