function TimeToString(time){
	var playtimeSeconds = (time / 60);
	var playtimeMinutes = (playtimeSeconds / 60);
	var playtimeHours = (playtimeMinutes / 60);
	
	return (string(floor(playtimeHours)) + ":" + string_format(floor(playtimeMinutes % 60), 2, 0) + ":" + string_format(floor(playtimeSeconds % 60), 2, 0));
}