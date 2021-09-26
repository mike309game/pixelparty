/// @description for text
with(dialoguer) {
	if(!ds_queue_empty(other.letterqueue)) {
		char = ds_queue_dequeue(other.letterqueue);
		colour = global.tscvalues[? "textcolour"];
		other.alarm[1] = global.tscvalues[? "textdelay"];
		event_perform(ev_other,ev_user0);
	} else {
		other.paused = 0;
	}
}