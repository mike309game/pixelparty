Music("mx_honest1",1);

var int = instance_create_depth(0,0,-999999999,ScriptSectionInterpreter);
with(int) {
	section = global.script_sections[? "handler test"];
	sectionName = "handler test";
	myHandler = instance_create_depth(0,0,-99999,ScriptDefaultHandler);
	myHandler.myInterpreter = id;
}