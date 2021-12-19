if(canInteract) {
	canInteract = false;
	myInterpreter = instance_create_depth(0,0,-16000,ScriptSectionInterpreter);
	with(myInterpreter) {
		sectionName = other.section;
		section = global.script_sections[? sectionName];
		myHandler = new HandlerCommon(id);
		myCaller = other.id;
	}
}