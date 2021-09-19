bgX = 0
bgY = 0

scale = 0

fade = 1
flash = 1

timer = 0

titlebpm = 145
bpmcalc = ((((titlebpm)/60)*4)/16)*2/7.5

selection = 1
//made = 0
mode = 0
bgmode = 0

filefound = 1

start_flash = 0
tstimer = 0

start_scale = 1

selection = 0
sel_freeze = 0
sel_lerp = [24,24,24]

bop = 1
rand = irandom_range(1,16)

alarm_set(1,100*(4*bpmcalc))

