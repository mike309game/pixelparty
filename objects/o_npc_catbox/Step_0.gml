// Inherit the parent event
event_inherited();

x = xstart + irandom_range(-shakeAmt,shakeAmt);
y = ystart + irandom_range(-shakeAmt,shakeAmt);

shakeAmt = max(shakeAmt - 1, 0);