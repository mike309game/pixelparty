section = 0;						//The command ds list of this section.
halted = 0;							//Processing is halted?
funcpos = 0;						//Current command's position.
currentarg = 1;						//Current argument being processed. Is 1 because argument 0 is the command's index.
sectionName = "";					//Name of the section being processed.
myHandler = noone;

//these will likely be removed because my smooth brain thought these were a good idea
letterqueue = ds_queue_create();
dialoguer = noone;
funcstack = ds_stack_create();