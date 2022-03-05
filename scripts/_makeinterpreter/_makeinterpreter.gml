function QuickInterpreter(section, handlerType = HandlerCommon){
	gml_pragma("forceinline");
	var inst = instance_create_depth(0,0,-1000,ScriptSectionInterpreter);
	with(inst) {
		sectionName = section;
		self.section = global.script_sections[? section];
		myHandler = new handlerType(id);
		myCaller = other.id;
	}
	return inst;
}