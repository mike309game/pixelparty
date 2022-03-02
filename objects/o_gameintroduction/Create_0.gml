dialogue = [
	"Manny...",
	"Wake up...",
	"Wake up Manny...",
	"Ah yes.. \nHello Manny",
	"I need to request a quite.. big.. favor from you.",
	"I will now place this 'favor' into your scheduler.",
	"You can find a description of your mission there.",
	"now go."
]
dialogue_counter = 0
text_counter = 0
count_rate = 0.1

display_text = true
text_alpha = 1
text_y = 120

local_animation_timer = 0
total_animation_timer = 0

outro = false
fade_alpha = 0

background_alpha = 0
second_background_pos = 0

text_spark_scale = 7

manny_scale = 0.8
manny_alpha = 0.2
manny_y = -48

alarm_set(0,15)

nextText = function() { //do it like THIS because if not the function will be in a global scope
	if(!display_text) {
		text_spark_scale = 7
		display_text = true
		text_alpha = 1
		dialogue_counter++
		text_counter = 0
	}// else exit; //this would just exit out of the function
}

// set music
