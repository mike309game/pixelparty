/// @description infinity cool title

var cooltitle = "          ππΈππΈ-π΅π π»ππ³ π°π½π³ π»π½π ππΎπ΅πππ°ππ΄ πΏππ΄ππ΄π½π...            πΏπΈππ΄π» πΏπ°πππ          "

window_set_caption(" "+string_copy(cooltitle,animatedTitleCounter,10)+" ")

if animatedTitleCounter > string_length(cooltitle)-10 then animatedTitleCounter = 0

animatedTitleCounter += 1;

alarm_set(1,20)