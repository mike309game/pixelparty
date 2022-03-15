function CallstackString(){
	gml_pragma("forceinline");
	var str = "";
	var callstack = debug_get_callstack();
	var len = array_length(callstack)-1; //last arg is a number
	for(var i = 0; i < len; i++) {
		str += "\n" + callstack[i];
	}
	return str;
}