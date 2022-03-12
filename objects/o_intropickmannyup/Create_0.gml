depth = -14000;
state = 0;

yProgress = 0; //0-120
goUp = false; //pointer goes up to spin manny around?

fadeOut = false;
fadeAlpha = 0;

//because i don't wanna deal with the script system stuff i'm just gonna make it offset manually here
x += 8;
//y += 12;
xstart = x;
ystart = y;

alarm[0] = 60; //in 1 second go up
NegateGameFlag(eFlag.playerCanSetDepth); //so manny doesn't go behind honstay