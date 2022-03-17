/// @description infinity cool title

var cooltitle = "          𝚈𝙸𝚂𝙸-𝙵𝚈 𝙻𝚃𝙳 𝙰𝙽𝙳 𝙻𝙽𝚇 𝚂𝙾𝙵𝚃𝚆𝙰𝚁𝙴 𝙿𝚁𝙴𝚂𝙴𝙽𝚃...            𝙿𝙸𝚇𝙴𝙻 𝙿𝙰𝚁𝚃𝚈          "

window_set_caption(" "+string_copy(cooltitle,animatedTitleCounter,10)+" ")

if animatedTitleCounter > string_length(cooltitle)-10 then animatedTitleCounter = 0

animatedTitleCounter += 1;

alarm_set(1,20)