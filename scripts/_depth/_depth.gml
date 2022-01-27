/// @func	SetDepth()
/// @desc	Sets the depth of caller. Is based on sprite_index's bottom middle.
function SetDepth(){
	gml_pragma("forceinline");
	depth = -(y + (sprite_height - sprite_yoffset) - 1);
}