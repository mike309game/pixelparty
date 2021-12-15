for (i = 0; i < 3; i += 1)
{
    if (c[i] < 10)
        u[i] = 1
    if (c[i] > 250)
        u[i] = 0
    if (u[i] == 1)
        c[i] += 2
    else
        c[i] -= 3
}
var color = make_color_rgb(c[0], c[1], c[2])

var lol = (sin(-global.time / 40 + m/20)*0.5+0.5)*256
draw_set_color(/*lol | (lol << 8) | (lol << 16)*/color);
var x1, y1, x2, y2, temp;
x1 = x
y1 = y
x2 = ((room_width / 2) + (room_width / m))
y2 = ((room_height / 2) + (room_height / m))
if (x1 > x2)
{
    temp = x1
    x1 = x2
    x2 = temp
}
if (y1 > y2)
{
    temp = y1
    y1 = y2
    y2 = temp
}
if (os_type == os_ps4 || os_type == os_psvita)
{
    x2++
    y2++
}
draw_rectangle(x1, y1, x2, y2, false)