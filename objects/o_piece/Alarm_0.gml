var letters = "PIECE";
with(instance_create_depth(152 + counter * 18, 81, -10000, o_piecegetletter)) {
	letter = string_char_at(letters, other.counter+1);
}
if(counter++ < 4) {
	alarm[0] = 6;
}