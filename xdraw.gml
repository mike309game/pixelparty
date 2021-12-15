/* PART OF THIS FILE HAS BEEN AUTOMATICALLY GENERATED ON Sun Nov 21 22:21:17 2021 */
global.__xdrawQueue = ds_queue_create();
global.__xdrawArgumentList = ds_list_create();

function XdrawExecuteQueue() {
	while(!ds_queue_empty(global.__xdrawQueue)) {
		repeat(ds_queue_dequeue(global.__xdrawQueue)) {
			ds_list_add(global.__xdrawArgumentList, ds_queue_dequeue(global.__xdrawQueue));
		}
		ds_queue_dequeue(global.__xdrawQueue)();
		ds_list_clear(global.__xdrawArgumentList);
	}
}

function __EXEC_xmp_grid_draw() {
	mp_grid_draw(global.__xdrawArgumentList[|0]);
}
function xmp_grid_draw(id) {
	ds_queue_enqueue(global.__xdrawQueue, 1, id, __EXEC_xmp_grid_draw);
}
function __EXEC_xdraw_self() {
	draw_self();
}
function xdraw_self() {
	ds_queue_enqueue(global.__xdrawQueue, 0, __EXEC_xdraw_self);
}
function __EXEC_xdraw_sprite() {
	draw_sprite(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3]);
}
function xdraw_sprite(sprite, subimg, x, y) {
	ds_queue_enqueue(global.__xdrawQueue, 4, sprite, subimg, x, y, __EXEC_xdraw_sprite);
}
function __EXEC_xdraw_sprite_pos() {
	draw_sprite_pos(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7], global.__xdrawArgumentList[|8], global.__xdrawArgumentList[|9], global.__xdrawArgumentList[|10]);
}
function xdraw_sprite_pos(sprite, subimg, x1, y1, x2, y2, x3, y3, x4, y4, alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 11, sprite, subimg, x1, y1, x2, y2, x3, y3, x4, y4, alpha, __EXEC_xdraw_sprite_pos);
}
function __EXEC_xdraw_sprite_ext() {
	draw_sprite_ext(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7], global.__xdrawArgumentList[|8]);
}
function xdraw_sprite_ext(sprite, subimg, x, y, xscale, yscale, rot, col, alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 9, sprite, subimg, x, y, xscale, yscale, rot, col, alpha, __EXEC_xdraw_sprite_ext);
}
function __EXEC_xdraw_sprite_stretched() {
	draw_sprite_stretched(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5]);
}
function xdraw_sprite_stretched(sprite, subimg, x, y, w, h) {
	ds_queue_enqueue(global.__xdrawQueue, 6, sprite, subimg, x, y, w, h, __EXEC_xdraw_sprite_stretched);
}
function __EXEC_xdraw_sprite_stretched_ext() {
	draw_sprite_stretched_ext(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7]);
}
function xdraw_sprite_stretched_ext(sprite, subimg, x, y, w, h, col, alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 8, sprite, subimg, x, y, w, h, col, alpha, __EXEC_xdraw_sprite_stretched_ext);
}
function __EXEC_xdraw_sprite_tiled() {
	draw_sprite_tiled(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3]);
}
function xdraw_sprite_tiled(sprite, subimg, x, y) {
	ds_queue_enqueue(global.__xdrawQueue, 4, sprite, subimg, x, y, __EXEC_xdraw_sprite_tiled);
}
function __EXEC_xdraw_sprite_tiled_ext() {
	draw_sprite_tiled_ext(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7]);
}
function xdraw_sprite_tiled_ext(sprite, subimg, x, y, xscale, yscale, col, alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 8, sprite, subimg, x, y, xscale, yscale, col, alpha, __EXEC_xdraw_sprite_tiled_ext);
}
function __EXEC_xdraw_sprite_part() {
	draw_sprite_part(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7]);
}
function xdraw_sprite_part(sprite, subimg, left, top, width, height, x, y) {
	ds_queue_enqueue(global.__xdrawQueue, 8, sprite, subimg, left, top, width, height, x, y, __EXEC_xdraw_sprite_part);
}
function __EXEC_xdraw_sprite_part_ext() {
	draw_sprite_part_ext(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7], global.__xdrawArgumentList[|8], global.__xdrawArgumentList[|9], global.__xdrawArgumentList[|10], global.__xdrawArgumentList[|11]);
}
function xdraw_sprite_part_ext(sprite, subimg, left, top, width, height, x, y, xscale, yscale, col, alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 12, sprite, subimg, left, top, width, height, x, y, xscale, yscale, col, alpha, __EXEC_xdraw_sprite_part_ext);
}
function __EXEC_xdraw_sprite_general() {
	draw_sprite_general(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7], global.__xdrawArgumentList[|8], global.__xdrawArgumentList[|9], global.__xdrawArgumentList[|10], global.__xdrawArgumentList[|11], global.__xdrawArgumentList[|12], global.__xdrawArgumentList[|13], global.__xdrawArgumentList[|14], global.__xdrawArgumentList[|15]);
}
function xdraw_sprite_general(sprite, subimg, left, top, width, height, x, y, xscale, yscale, rot, c1, c2, c3, c4, alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 16, sprite, subimg, left, top, width, height, x, y, xscale, yscale, rot, c1, c2, c3, c4, alpha, __EXEC_xdraw_sprite_general);
}
function __EXEC_xdraw_clear() {
	draw_clear(global.__xdrawArgumentList[|0]);
}
function xdraw_clear(col) {
	ds_queue_enqueue(global.__xdrawQueue, 1, col, __EXEC_xdraw_clear);
}
function __EXEC_xdraw_clear_alpha() {
	draw_clear_alpha(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1]);
}
function xdraw_clear_alpha(col, alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 2, col, alpha, __EXEC_xdraw_clear_alpha);
}
function __EXEC_xdraw_point() {
	draw_point(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1]);
}
function xdraw_point(x, y) {
	ds_queue_enqueue(global.__xdrawQueue, 2, x, y, __EXEC_xdraw_point);
}
function __EXEC_xdraw_line() {
	draw_line(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3]);
}
function xdraw_line(x1, y1, x2, y2) {
	ds_queue_enqueue(global.__xdrawQueue, 4, x1, y1, x2, y2, __EXEC_xdraw_line);
}
function __EXEC_xdraw_line_width() {
	draw_line_width(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4]);
}
function xdraw_line_width(x1, y1, x2, y2, w) {
	ds_queue_enqueue(global.__xdrawQueue, 5, x1, y1, x2, y2, w, __EXEC_xdraw_line_width);
}
function __EXEC_xdraw_rectangle() {
	draw_rectangle(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4]);
}
function xdraw_rectangle(x1, y1, x2, y2, outline) {
	ds_queue_enqueue(global.__xdrawQueue, 5, x1, y1, x2, y2, outline, __EXEC_xdraw_rectangle);
}
function __EXEC_xdraw_roundrect() {
	draw_roundrect(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4]);
}
function xdraw_roundrect(x1, y1, x2, y2, outline) {
	ds_queue_enqueue(global.__xdrawQueue, 5, x1, y1, x2, y2, outline, __EXEC_xdraw_roundrect);
}
function __EXEC_xdraw_roundrect_ext() {
	draw_roundrect_ext(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6]);
}
function xdraw_roundrect_ext(x1, y1, x2, y2, radiusx, radiusy, outline) {
	ds_queue_enqueue(global.__xdrawQueue, 7, x1, y1, x2, y2, radiusx, radiusy, outline, __EXEC_xdraw_roundrect_ext);
}
function __EXEC_xdraw_triangle() {
	draw_triangle(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6]);
}
function xdraw_triangle(x1, y1, x2, y2, x3, y3, outline) {
	ds_queue_enqueue(global.__xdrawQueue, 7, x1, y1, x2, y2, x3, y3, outline, __EXEC_xdraw_triangle);
}
function __EXEC_xdraw_circle() {
	draw_circle(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3]);
}
function xdraw_circle(x, y, r, outline) {
	ds_queue_enqueue(global.__xdrawQueue, 4, x, y, r, outline, __EXEC_xdraw_circle);
}
function __EXEC_xdraw_ellipse() {
	draw_ellipse(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4]);
}
function xdraw_ellipse(x1, y1, x2, y2, outline) {
	ds_queue_enqueue(global.__xdrawQueue, 5, x1, y1, x2, y2, outline, __EXEC_xdraw_ellipse);
}
function __EXEC_xdraw_set_circle_precision() {
	draw_set_circle_precision(global.__xdrawArgumentList[|0]);
}
function xdraw_set_circle_precision(precision) {
	ds_queue_enqueue(global.__xdrawQueue, 1, precision, __EXEC_xdraw_set_circle_precision);
}
function __EXEC_xdraw_arrow() {
	draw_arrow(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4]);
}
function xdraw_arrow(x1, y1, x2, y2, size) {
	ds_queue_enqueue(global.__xdrawQueue, 5, x1, y1, x2, y2, size, __EXEC_xdraw_arrow);
}
function __EXEC_xdraw_button() {
	draw_button(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4]);
}
function xdraw_button(x1, y1, x2, y2, up) {
	ds_queue_enqueue(global.__xdrawQueue, 5, x1, y1, x2, y2, up, __EXEC_xdraw_button);
}
function __EXEC_xdraw_path() {
	draw_path(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3]);
}
function xdraw_path(path, x, y, absolute) {
	ds_queue_enqueue(global.__xdrawQueue, 4, path, x, y, absolute, __EXEC_xdraw_path);
}
function __EXEC_xdraw_healthbar() {
	draw_healthbar(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7], global.__xdrawArgumentList[|8], global.__xdrawArgumentList[|9], global.__xdrawArgumentList[|10]);
}
function xdraw_healthbar(x1, y1, x2, y2, amount, backcol, mincol, maxcol, direction, showback, showborder) {
	ds_queue_enqueue(global.__xdrawQueue, 11, x1, y1, x2, y2, amount, backcol, mincol, maxcol, direction, showback, showborder, __EXEC_xdraw_healthbar);
}
function __EXEC_xdraw_getpixel() {
	draw_getpixel(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1]);
}
function xdraw_getpixel(x, y) {
	ds_queue_enqueue(global.__xdrawQueue, 2, x, y, __EXEC_xdraw_getpixel);
}
function __EXEC_xdraw_getpixel_ext() {
	draw_getpixel_ext(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1]);
}
function xdraw_getpixel_ext(x, y) {
	ds_queue_enqueue(global.__xdrawQueue, 2, x, y, __EXEC_xdraw_getpixel_ext);
}
function __EXEC_xdraw_set_colour() {
	draw_set_colour(global.__xdrawArgumentList[|0]);
}
function xdraw_set_colour(col) {
	ds_queue_enqueue(global.__xdrawQueue, 1, col, __EXEC_xdraw_set_colour);
}
function __EXEC_xdraw_set_color() {
	draw_set_color(global.__xdrawArgumentList[|0]);
}
function xdraw_set_color(col) {
	ds_queue_enqueue(global.__xdrawQueue, 1, col, __EXEC_xdraw_set_color);
}
function __EXEC_xdraw_set_alpha() {
	draw_set_alpha(global.__xdrawArgumentList[|0]);
}
function xdraw_set_alpha(alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 1, alpha, __EXEC_xdraw_set_alpha);
}
function __EXEC_xdraw_get_colour() {
	draw_get_colour();
}
function xdraw_get_colour() {
	ds_queue_enqueue(global.__xdrawQueue, 0, __EXEC_xdraw_get_colour);
}
function __EXEC_xdraw_get_color() {
	draw_get_color();
}
function xdraw_get_color() {
	ds_queue_enqueue(global.__xdrawQueue, 0, __EXEC_xdraw_get_color);
}
function __EXEC_xdraw_get_alpha() {
	draw_get_alpha();
}
function xdraw_get_alpha() {
	ds_queue_enqueue(global.__xdrawQueue, 0, __EXEC_xdraw_get_alpha);
}
function __EXEC_xgif_add_surface() {
	gif_add_surface(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3]);
}
/*function xgif_add_surface(gifindex, surfaceindex, delaytime, ...) {
	ds_queue_enqueue(global.__xdrawQueue, 4, gifindex, surfaceindex, delaytime, ..., __EXEC_xgif_add_surface);
}*/
function __EXEC_xdraw_set_font() {
	draw_set_font(global.__xdrawArgumentList[|0]);
}
function xdraw_set_font(font) {
	ds_queue_enqueue(global.__xdrawQueue, 1, font, __EXEC_xdraw_set_font);
}
function __EXEC_xdraw_get_font() {
	draw_get_font();
}
function xdraw_get_font() {
	ds_queue_enqueue(global.__xdrawQueue, 0, __EXEC_xdraw_get_font);
}
function __EXEC_xdraw_set_halign() {
	draw_set_halign(global.__xdrawArgumentList[|0]);
}
function xdraw_set_halign(halign) {
	ds_queue_enqueue(global.__xdrawQueue, 1, halign, __EXEC_xdraw_set_halign);
}
function __EXEC_xdraw_get_halign() {
	draw_get_halign();
}
function xdraw_get_halign() {
	ds_queue_enqueue(global.__xdrawQueue, 0, __EXEC_xdraw_get_halign);
}
function __EXEC_xdraw_set_valign() {
	draw_set_valign(global.__xdrawArgumentList[|0]);
}
function xdraw_set_valign(valign) {
	ds_queue_enqueue(global.__xdrawQueue, 1, valign, __EXEC_xdraw_set_valign);
}
function __EXEC_xdraw_get_valign() {
	draw_get_valign();
}
function xdraw_get_valign() {
	ds_queue_enqueue(global.__xdrawQueue, 0, __EXEC_xdraw_get_valign);
}
function __EXEC_xdraw_text() {
	draw_text(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2]);
}
function xdraw_text(x, y, string) {
	ds_queue_enqueue(global.__xdrawQueue, 3, x, y, string, __EXEC_xdraw_text);
}
function __EXEC_xdraw_text_ext() {
	draw_text_ext(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4]);
}
function xdraw_text_ext(x, y, string, sep, w) {
	ds_queue_enqueue(global.__xdrawQueue, 5, x, y, string, sep, w, __EXEC_xdraw_text_ext);
}
function __EXEC_xdraw_text_transformed() {
	draw_text_transformed(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5]);
}
function xdraw_text_transformed(x, y, string, xscale, yscale, angle) {
	ds_queue_enqueue(global.__xdrawQueue, 6, x, y, string, xscale, yscale, angle, __EXEC_xdraw_text_transformed);
}
function __EXEC_xdraw_text_ext_transformed() {
	draw_text_ext_transformed(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7]);
}
function xdraw_text_ext_transformed(x, y, string, sep, w, xscale, yscale, angle) {
	ds_queue_enqueue(global.__xdrawQueue, 8, x, y, string, sep, w, xscale, yscale, angle, __EXEC_xdraw_text_ext_transformed);
}
function __EXEC_xdraw_text_colour() {
	draw_text_colour(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7]);
}
function xdraw_text_colour(x, y, string, c1, c2, c3, c4, alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 8, x, y, string, c1, c2, c3, c4, alpha, __EXEC_xdraw_text_colour);
}
function __EXEC_xdraw_text_ext_colour() {
	draw_text_ext_colour(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7], global.__xdrawArgumentList[|8], global.__xdrawArgumentList[|9]);
}
function xdraw_text_ext_colour(x, y, string, sep, w, c1, c2, c3, c4, alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 10, x, y, string, sep, w, c1, c2, c3, c4, alpha, __EXEC_xdraw_text_ext_colour);
}
function __EXEC_xdraw_text_transformed_colour() {
	draw_text_transformed_colour(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7], global.__xdrawArgumentList[|8], global.__xdrawArgumentList[|9], global.__xdrawArgumentList[|10]);
}
function xdraw_text_transformed_colour(x, y, string, xscale, yscale, angle, c1, c2, c3, c4, alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 11, x, y, string, xscale, yscale, angle, c1, c2, c3, c4, alpha, __EXEC_xdraw_text_transformed_colour);
}
function __EXEC_xdraw_text_ext_transformed_colour() {
	draw_text_ext_transformed_colour(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7], global.__xdrawArgumentList[|8], global.__xdrawArgumentList[|9], global.__xdrawArgumentList[|10], global.__xdrawArgumentList[|11], global.__xdrawArgumentList[|12]);
}
function xdraw_text_ext_transformed_colour(x, y, string, sep, w, xscale, yscale, angle, c1, c2, c3, c4, alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 13, x, y, string, sep, w, xscale, yscale, angle, c1, c2, c3, c4, alpha, __EXEC_xdraw_text_ext_transformed_colour);
}
function __EXEC_xdraw_text_color() {
	draw_text_color(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7]);
}
function xdraw_text_color(x, y, string, c1, c2, c3, c4, alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 8, x, y, string, c1, c2, c3, c4, alpha, __EXEC_xdraw_text_color);
}
function __EXEC_xdraw_text_ext_color() {
	draw_text_ext_color(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7], global.__xdrawArgumentList[|8], global.__xdrawArgumentList[|9]);
}
function xdraw_text_ext_color(x, y, string, sep, w, c1, c2, c3, c4, alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 10, x, y, string, sep, w, c1, c2, c3, c4, alpha, __EXEC_xdraw_text_ext_color);
}
function __EXEC_xdraw_text_transformed_color() {
	draw_text_transformed_color(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7], global.__xdrawArgumentList[|8], global.__xdrawArgumentList[|9], global.__xdrawArgumentList[|10]);
}
function xdraw_text_transformed_color(x, y, string, xscale, yscale, angle, c1, c2, c3, c4, alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 11, x, y, string, xscale, yscale, angle, c1, c2, c3, c4, alpha, __EXEC_xdraw_text_transformed_color);
}
function __EXEC_xdraw_text_ext_transformed_color() {
	draw_text_ext_transformed_color(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7], global.__xdrawArgumentList[|8], global.__xdrawArgumentList[|9], global.__xdrawArgumentList[|10], global.__xdrawArgumentList[|11], global.__xdrawArgumentList[|12]);
}
function xdraw_text_ext_transformed_color(x, y, string, sep, w, xscale, yscale, angle, c1, c2, c3, c4, alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 13, x, y, string, sep, w, xscale, yscale, angle, c1, c2, c3, c4, alpha, __EXEC_xdraw_text_ext_transformed_color);
}
function __EXEC_xdraw_point_colour() {
	draw_point_colour(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2]);
}
function xdraw_point_colour(x, y, col1) {
	ds_queue_enqueue(global.__xdrawQueue, 3, x, y, col1, __EXEC_xdraw_point_colour);
}
function __EXEC_xdraw_line_colour() {
	draw_line_colour(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5]);
}
function xdraw_line_colour(x1, y1, x2, y2, col1, col2) {
	ds_queue_enqueue(global.__xdrawQueue, 6, x1, y1, x2, y2, col1, col2, __EXEC_xdraw_line_colour);
}
function __EXEC_xdraw_line_width_colour() {
	draw_line_width_colour(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6]);
}
function xdraw_line_width_colour(x1, y1, x2, y2, w, col1, col2) {
	ds_queue_enqueue(global.__xdrawQueue, 7, x1, y1, x2, y2, w, col1, col2, __EXEC_xdraw_line_width_colour);
}
function __EXEC_xdraw_rectangle_colour() {
	draw_rectangle_colour(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7], global.__xdrawArgumentList[|8]);
}
function xdraw_rectangle_colour(x1, y1, x2, y2, col1, col2, col3, col4, outline) {
	ds_queue_enqueue(global.__xdrawQueue, 9, x1, y1, x2, y2, col1, col2, col3, col4, outline, __EXEC_xdraw_rectangle_colour);
}
function __EXEC_xdraw_roundrect_colour() {
	draw_roundrect_colour(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6]);
}
function xdraw_roundrect_colour(x1, y1, x2, y2, col1, col2, outline) {
	ds_queue_enqueue(global.__xdrawQueue, 7, x1, y1, x2, y2, col1, col2, outline, __EXEC_xdraw_roundrect_colour);
}
function __EXEC_xdraw_roundrect_colour_ext() {
	draw_roundrect_colour_ext(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7], global.__xdrawArgumentList[|8]);
}
function xdraw_roundrect_colour_ext(x1, y1, x2, y2, radiusx, radiusy, col1, col2, outline) {
	ds_queue_enqueue(global.__xdrawQueue, 9, x1, y1, x2, y2, radiusx, radiusy, col1, col2, outline, __EXEC_xdraw_roundrect_colour_ext);
}
function __EXEC_xdraw_triangle_colour() {
	draw_triangle_colour(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7], global.__xdrawArgumentList[|8], global.__xdrawArgumentList[|9]);
}
function xdraw_triangle_colour(x1, y1, x2, y2, x3, y3, col1, col2, col3, outline) {
	ds_queue_enqueue(global.__xdrawQueue, 10, x1, y1, x2, y2, x3, y3, col1, col2, col3, outline, __EXEC_xdraw_triangle_colour);
}
function __EXEC_xdraw_circle_colour() {
	draw_circle_colour(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5]);
}
function xdraw_circle_colour(x, y, r, col1, col2, outline) {
	ds_queue_enqueue(global.__xdrawQueue, 6, x, y, r, col1, col2, outline, __EXEC_xdraw_circle_colour);
}
function __EXEC_xdraw_ellipse_colour() {
	draw_ellipse_colour(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6]);
}
function xdraw_ellipse_colour(x1, y1, x2, y2, col1, col2, outline) {
	ds_queue_enqueue(global.__xdrawQueue, 7, x1, y1, x2, y2, col1, col2, outline, __EXEC_xdraw_ellipse_colour);
}
function __EXEC_xdraw_point_color() {
	draw_point_color(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2]);
}
function xdraw_point_color(x, y, col1) {
	ds_queue_enqueue(global.__xdrawQueue, 3, x, y, col1, __EXEC_xdraw_point_color);
}
function __EXEC_xdraw_line_color() {
	draw_line_color(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5]);
}
function xdraw_line_color(x1, y1, x2, y2, col1, col2) {
	ds_queue_enqueue(global.__xdrawQueue, 6, x1, y1, x2, y2, col1, col2, __EXEC_xdraw_line_color);
}
function __EXEC_xdraw_line_width_color() {
	draw_line_width_color(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6]);
}
function xdraw_line_width_color(x1, y1, x2, y2, w, col1, col2) {
	ds_queue_enqueue(global.__xdrawQueue, 7, x1, y1, x2, y2, w, col1, col2, __EXEC_xdraw_line_width_color);
}
function __EXEC_xdraw_rectangle_color() {
	draw_rectangle_color(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7], global.__xdrawArgumentList[|8]);
}
function xdraw_rectangle_color(x1, y1, x2, y2, col1, col2, col3, col4, outline) {
	ds_queue_enqueue(global.__xdrawQueue, 9, x1, y1, x2, y2, col1, col2, col3, col4, outline, __EXEC_xdraw_rectangle_color);
}
function __EXEC_xdraw_roundrect_color() {
	draw_roundrect_color(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6]);
}
function xdraw_roundrect_color(x1, y1, x2, y2, col1, col2, outline) {
	ds_queue_enqueue(global.__xdrawQueue, 7, x1, y1, x2, y2, col1, col2, outline, __EXEC_xdraw_roundrect_color);
}
function __EXEC_xdraw_roundrect_color_ext() {
	draw_roundrect_color_ext(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7], global.__xdrawArgumentList[|8]);
}
function xdraw_roundrect_color_ext(x1, y1, x2, y2, radiusx, radiusy, col1, col2, outline) {
	ds_queue_enqueue(global.__xdrawQueue, 9, x1, y1, x2, y2, radiusx, radiusy, col1, col2, outline, __EXEC_xdraw_roundrect_color_ext);
}
function __EXEC_xdraw_triangle_color() {
	draw_triangle_color(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7], global.__xdrawArgumentList[|8], global.__xdrawArgumentList[|9]);
}
function xdraw_triangle_color(x1, y1, x2, y2, x3, y3, col1, col2, col3, outline) {
	ds_queue_enqueue(global.__xdrawQueue, 10, x1, y1, x2, y2, x3, y3, col1, col2, col3, outline, __EXEC_xdraw_triangle_color);
}
function __EXEC_xdraw_circle_color() {
	draw_circle_color(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5]);
}
function xdraw_circle_color(x, y, r, col1, col2, outline) {
	ds_queue_enqueue(global.__xdrawQueue, 6, x, y, r, col1, col2, outline, __EXEC_xdraw_circle_color);
}
function __EXEC_xdraw_ellipse_color() {
	draw_ellipse_color(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6]);
}
function xdraw_ellipse_color(x1, y1, x2, y2, col1, col2, outline) {
	ds_queue_enqueue(global.__xdrawQueue, 7, x1, y1, x2, y2, col1, col2, outline, __EXEC_xdraw_ellipse_color);
}
function __EXEC_xdraw_primitive_begin() {
	draw_primitive_begin(global.__xdrawArgumentList[|0]);
}
function xdraw_primitive_begin(kind) {
	ds_queue_enqueue(global.__xdrawQueue, 1, kind, __EXEC_xdraw_primitive_begin);
}
function __EXEC_xdraw_vertex() {
	draw_vertex(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1]);
}
function xdraw_vertex(x, y) {
	ds_queue_enqueue(global.__xdrawQueue, 2, x, y, __EXEC_xdraw_vertex);
}
function __EXEC_xdraw_vertex_colour() {
	draw_vertex_colour(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3]);
}
function xdraw_vertex_colour(x, y, col, alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 4, x, y, col, alpha, __EXEC_xdraw_vertex_colour);
}
function __EXEC_xdraw_vertex_color() {
	draw_vertex_color(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3]);
}
function xdraw_vertex_color(x, y, col, alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 4, x, y, col, alpha, __EXEC_xdraw_vertex_color);
}
function __EXEC_xdraw_primitive_end() {
	draw_primitive_end();
}
function xdraw_primitive_end() {
	ds_queue_enqueue(global.__xdrawQueue, 0, __EXEC_xdraw_primitive_end);
}
function __EXEC_xdraw_primitive_begin_texture() {
	draw_primitive_begin_texture(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1]);
}
function xdraw_primitive_begin_texture(kind, texid) {
	ds_queue_enqueue(global.__xdrawQueue, 2, kind, texid, __EXEC_xdraw_primitive_begin_texture);
}
function __EXEC_xdraw_vertex_texture() {
	draw_vertex_texture(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3]);
}
function xdraw_vertex_texture(x, y, xtex, ytex) {
	ds_queue_enqueue(global.__xdrawQueue, 4, x, y, xtex, ytex, __EXEC_xdraw_vertex_texture);
}
function __EXEC_xdraw_vertex_texture_colour() {
	draw_vertex_texture_colour(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5]);
}
function xdraw_vertex_texture_colour(x, y, xtex, ytex, col, alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 6, x, y, xtex, ytex, col, alpha, __EXEC_xdraw_vertex_texture_colour);
}
function __EXEC_xdraw_vertex_texture_color() {
	draw_vertex_texture_color(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5]);
}
function xdraw_vertex_texture_color(x, y, xtex, ytex, col, alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 6, x, y, xtex, ytex, col, alpha, __EXEC_xdraw_vertex_texture_color);
}
function __EXEC_xsurface_create() {
	surface_create(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1]);
}
function xsurface_create(w, h) {
	ds_queue_enqueue(global.__xdrawQueue, 2, w, h, __EXEC_xsurface_create);
}
function __EXEC_xsurface_create_ext() {
	surface_create_ext(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2]);
}
function xsurface_create_ext(name, w, h) {
	ds_queue_enqueue(global.__xdrawQueue, 3, name, w, h, __EXEC_xsurface_create_ext);
}
function __EXEC_xsurface_resize() {
	surface_resize(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2]);
}
function xsurface_resize(id, width, height) {
	ds_queue_enqueue(global.__xdrawQueue, 3, id, width, height, __EXEC_xsurface_resize);
}
function __EXEC_xsurface_free() {
	surface_free(global.__xdrawArgumentList[|0]);
}
function xsurface_free(id) {
	ds_queue_enqueue(global.__xdrawQueue, 1, id, __EXEC_xsurface_free);
}
function __EXEC_xsurface_exists() {
	surface_exists(global.__xdrawArgumentList[|0]);
}
function xsurface_exists(id) {
	ds_queue_enqueue(global.__xdrawQueue, 1, id, __EXEC_xsurface_exists);
}
function __EXEC_xsurface_get_width() {
	surface_get_width(global.__xdrawArgumentList[|0]);
}
function xsurface_get_width(id) {
	ds_queue_enqueue(global.__xdrawQueue, 1, id, __EXEC_xsurface_get_width);
}
function __EXEC_xsurface_get_height() {
	surface_get_height(global.__xdrawArgumentList[|0]);
}
function xsurface_get_height(id) {
	ds_queue_enqueue(global.__xdrawQueue, 1, id, __EXEC_xsurface_get_height);
}
function __EXEC_xsurface_get_texture() {
	surface_get_texture(global.__xdrawArgumentList[|0]);
}
function xsurface_get_texture(id) {
	ds_queue_enqueue(global.__xdrawQueue, 1, id, __EXEC_xsurface_get_texture);
}
function __EXEC_xsurface_set_target() {
	surface_set_target(global.__xdrawArgumentList[|0]);
}
function xsurface_set_target(id) {
	ds_queue_enqueue(global.__xdrawQueue, 1, id, __EXEC_xsurface_set_target);
}
function __EXEC_xsurface_set_target_ext() {
	surface_set_target_ext(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1]);
}
function xsurface_set_target_ext(index, id) {
	ds_queue_enqueue(global.__xdrawQueue, 2, index, id, __EXEC_xsurface_set_target_ext);
}
function __EXEC_xsurface_get_target() {
	surface_get_target();
}
function xsurface_get_target() {
	ds_queue_enqueue(global.__xdrawQueue, 0, __EXEC_xsurface_get_target);
}
function __EXEC_xsurface_get_target_ext() {
	surface_get_target_ext(global.__xdrawArgumentList[|0]);
}
function xsurface_get_target_ext(index) {
	ds_queue_enqueue(global.__xdrawQueue, 1, index, __EXEC_xsurface_get_target_ext);
}
function __EXEC_xsurface_reset_target() {
	surface_reset_target();
}
function xsurface_reset_target() {
	ds_queue_enqueue(global.__xdrawQueue, 0, __EXEC_xsurface_reset_target);
}
function __EXEC_xsurface_depth_disable() {
	surface_depth_disable(global.__xdrawArgumentList[|0]);
}
function xsurface_depth_disable(disable) {
	ds_queue_enqueue(global.__xdrawQueue, 1, disable, __EXEC_xsurface_depth_disable);
}
function __EXEC_xsurface_get_depth_disable() {
	surface_get_depth_disable();
}
function xsurface_get_depth_disable() {
	ds_queue_enqueue(global.__xdrawQueue, 0, __EXEC_xsurface_get_depth_disable);
}
function __EXEC_xdraw_surface() {
	draw_surface(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2]);
}
function xdraw_surface(id, x, y) {
	ds_queue_enqueue(global.__xdrawQueue, 3, id, x, y, __EXEC_xdraw_surface);
}
function __EXEC_xdraw_surface_stretched() {
	draw_surface_stretched(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4]);
}
function xdraw_surface_stretched(id, x, y, w, h) {
	ds_queue_enqueue(global.__xdrawQueue, 5, id, x, y, w, h, __EXEC_xdraw_surface_stretched);
}
function __EXEC_xdraw_surface_tiled() {
	draw_surface_tiled(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2]);
}
function xdraw_surface_tiled(id, x, y) {
	ds_queue_enqueue(global.__xdrawQueue, 3, id, x, y, __EXEC_xdraw_surface_tiled);
}
function __EXEC_xdraw_surface_part() {
	draw_surface_part(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6]);
}
function xdraw_surface_part(id, left, top, width, height, x, y) {
	ds_queue_enqueue(global.__xdrawQueue, 7, id, left, top, width, height, x, y, __EXEC_xdraw_surface_part);
}
function __EXEC_xdraw_surface_ext() {
	draw_surface_ext(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7]);
}
function xdraw_surface_ext(id, x, y, xscale, yscale, rot, col, alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 8, id, x, y, xscale, yscale, rot, col, alpha, __EXEC_xdraw_surface_ext);
}
function __EXEC_xdraw_surface_stretched_ext() {
	draw_surface_stretched_ext(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6]);
}
function xdraw_surface_stretched_ext(id, x, y, w, h, col, alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 7, id, x, y, w, h, col, alpha, __EXEC_xdraw_surface_stretched_ext);
}
function __EXEC_xdraw_surface_tiled_ext() {
	draw_surface_tiled_ext(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6]);
}
function xdraw_surface_tiled_ext(id, x, y, xscale, yscale, col, alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 7, id, x, y, xscale, yscale, col, alpha, __EXEC_xdraw_surface_tiled_ext);
}
function __EXEC_xdraw_surface_part_ext() {
	draw_surface_part_ext(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7], global.__xdrawArgumentList[|8], global.__xdrawArgumentList[|9], global.__xdrawArgumentList[|10]);
}
function xdraw_surface_part_ext(id, left, top, width, height, x, y, xscale, yscale, col, alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 11, id, left, top, width, height, x, y, xscale, yscale, col, alpha, __EXEC_xdraw_surface_part_ext);
}
function __EXEC_xdraw_surface_general() {
	draw_surface_general(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7], global.__xdrawArgumentList[|8], global.__xdrawArgumentList[|9], global.__xdrawArgumentList[|10], global.__xdrawArgumentList[|11], global.__xdrawArgumentList[|12], global.__xdrawArgumentList[|13], global.__xdrawArgumentList[|14]);
}
function xdraw_surface_general(id, left, top, width, height, x, y, xscale, yscale, rot, c1, c2, c3, c4, alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 15, id, left, top, width, height, x, y, xscale, yscale, rot, c1, c2, c3, c4, alpha, __EXEC_xdraw_surface_general);
}
function __EXEC_xsurface_getpixel() {
	surface_getpixel(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2]);
}
function xsurface_getpixel(id, x, y) {
	ds_queue_enqueue(global.__xdrawQueue, 3, id, x, y, __EXEC_xsurface_getpixel);
}
function __EXEC_xsurface_getpixel_ext() {
	surface_getpixel_ext(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2]);
}
function xsurface_getpixel_ext(id, x, y) {
	ds_queue_enqueue(global.__xdrawQueue, 3, id, x, y, __EXEC_xsurface_getpixel_ext);
}
function __EXEC_xsurface_save() {
	surface_save(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1]);
}
function xsurface_save(id, fname) {
	ds_queue_enqueue(global.__xdrawQueue, 2, id, fname, __EXEC_xsurface_save);
}
function __EXEC_xsurface_save_part() {
	surface_save_part(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5]);
}
function xsurface_save_part(id, fname, x, y, w, h) {
	ds_queue_enqueue(global.__xdrawQueue, 6, id, fname, x, y, w, h, __EXEC_xsurface_save_part);
}
function __EXEC_xsurface_copy() {
	surface_copy(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3]);
}
function xsurface_copy(destination, x, y, source) {
	ds_queue_enqueue(global.__xdrawQueue, 4, destination, x, y, source, __EXEC_xsurface_copy);
}
function __EXEC_xsurface_copy_part() {
	surface_copy_part(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7]);
}
function xsurface_copy_part(destination, x, y, source, xs, ys, ws, hs) {
	ds_queue_enqueue(global.__xdrawQueue, 8, destination, x, y, source, xs, ys, ws, hs, __EXEC_xsurface_copy_part);
}
function __EXEC_xapplication_surface_draw_enable() {
	application_surface_draw_enable(global.__xdrawArgumentList[|0]);
}
function xapplication_surface_draw_enable(on_off) {
	ds_queue_enqueue(global.__xdrawQueue, 1, on_off, __EXEC_xapplication_surface_draw_enable);
}
function __EXEC_xapplication_surface_enable() {
	application_surface_enable(global.__xdrawArgumentList[|0]);
}
function xapplication_surface_enable(enable) {
	ds_queue_enqueue(global.__xdrawQueue, 1, enable, __EXEC_xapplication_surface_enable);
}
function __EXEC_xapplication_surface_is_enabled() {
	application_surface_is_enabled();
}
function xapplication_surface_is_enabled() {
	ds_queue_enqueue(global.__xdrawQueue, 0, __EXEC_xapplication_surface_is_enabled);
}
function __EXEC_xdraw_highscore() {
	draw_highscore(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3]);
}
function xdraw_highscore(x1, y1, x2, y2) {
	ds_queue_enqueue(global.__xdrawQueue, 4, x1, y1, x2, y2, __EXEC_xdraw_highscore);
}
function __EXEC_xsprite_create_from_surface() {
	sprite_create_from_surface(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7], global.__xdrawArgumentList[|8]);
}
function xsprite_create_from_surface(id, x, y, w, h, removeback, smooth, xorig, yorig) {
	ds_queue_enqueue(global.__xdrawQueue, 9, id, x, y, w, h, removeback, smooth, xorig, yorig, __EXEC_xsprite_create_from_surface);
}
function __EXEC_xsprite_add_from_surface() {
	sprite_add_from_surface(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7]);
}
function xsprite_add_from_surface(ind, id, x, y, w, h, removeback, smooth) {
	ds_queue_enqueue(global.__xdrawQueue, 8, ind, id, x, y, w, h, removeback, smooth, __EXEC_xsprite_add_from_surface);
}
function __EXEC_xpart_system_draw_order() {
	part_system_draw_order(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1]);
}
function xpart_system_draw_order(ind, oldtonew) {
	ds_queue_enqueue(global.__xdrawQueue, 2, ind, oldtonew, __EXEC_xpart_system_draw_order);
}
function __EXEC_xpart_system_automatic_draw() {
	part_system_automatic_draw(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1]);
}
function xpart_system_automatic_draw(ind, draw) {
	ds_queue_enqueue(global.__xdrawQueue, 2, ind, draw, __EXEC_xpart_system_automatic_draw);
}
function __EXEC_xpart_system_drawit() {
	part_system_drawit(global.__xdrawArgumentList[|0]);
}
function xpart_system_drawit(ind) {
	ds_queue_enqueue(global.__xdrawQueue, 1, ind, __EXEC_xpart_system_drawit);
}
function __EXEC_xmatrix_get() {
	matrix_get(global.__xdrawArgumentList[|0]);
}
function xmatrix_get(type) {
	ds_queue_enqueue(global.__xdrawQueue, 1, type, __EXEC_xmatrix_get);
}
function __EXEC_xmatrix_set() {
	matrix_set(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1]);
}
function xmatrix_set(type, matrix) {
	ds_queue_enqueue(global.__xdrawQueue, 2, type, matrix, __EXEC_xmatrix_set);
}
function __EXEC_xmatrix_build_identity() {
	matrix_build_identity();
}
function xmatrix_build_identity() {
	ds_queue_enqueue(global.__xdrawQueue, 0, __EXEC_xmatrix_build_identity);
}
function __EXEC_xmatrix_build() {
	matrix_build(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7], global.__xdrawArgumentList[|8]);
}
function xmatrix_build(x, y, z, xrotation, yrotation, zrotation, xscale, yscale, zscale) {
	ds_queue_enqueue(global.__xdrawQueue, 9, x, y, z, xrotation, yrotation, zrotation, xscale, yscale, zscale, __EXEC_xmatrix_build);
}
function __EXEC_xmatrix_build_lookat() {
	matrix_build_lookat(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7], global.__xdrawArgumentList[|8]);
}
function xmatrix_build_lookat(xfrom, yfrom, zfrom, xto, yto, zto, xup, yup, zup) {
	ds_queue_enqueue(global.__xdrawQueue, 9, xfrom, yfrom, zfrom, xto, yto, zto, xup, yup, zup, __EXEC_xmatrix_build_lookat);
}
function __EXEC_xmatrix_build_projection_ortho() {
	matrix_build_projection_ortho(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3]);
}
function xmatrix_build_projection_ortho(width, height, znear, zfar) {
	ds_queue_enqueue(global.__xdrawQueue, 4, width, height, znear, zfar, __EXEC_xmatrix_build_projection_ortho);
}
function __EXEC_xmatrix_build_projection_perspective() {
	matrix_build_projection_perspective(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3]);
}
function xmatrix_build_projection_perspective(width, height, znear, zfar) {
	ds_queue_enqueue(global.__xdrawQueue, 4, width, height, znear, zfar, __EXEC_xmatrix_build_projection_perspective);
}
function __EXEC_xmatrix_build_projection_perspective_fov() {
	matrix_build_projection_perspective_fov(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3]);
}
function xmatrix_build_projection_perspective_fov(fov_y, aspect, znear, zfar) {
	ds_queue_enqueue(global.__xdrawQueue, 4, fov_y, aspect, znear, zfar, __EXEC_xmatrix_build_projection_perspective_fov);
}
function __EXEC_xmatrix_multiply() {
	matrix_multiply(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1]);
}
function xmatrix_multiply(matrix1, matrix2) {
	ds_queue_enqueue(global.__xdrawQueue, 2, matrix1, matrix2, __EXEC_xmatrix_multiply);
}
function __EXEC_xmatrix_transform_vertex() {
	matrix_transform_vertex(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3]);
}
function xmatrix_transform_vertex(matrix, x, y, z) {
	ds_queue_enqueue(global.__xdrawQueue, 4, matrix, x, y, z, __EXEC_xmatrix_transform_vertex);
}
function __EXEC_xmatrix_stack_push() {
	matrix_stack_push(global.__xdrawArgumentList[|0]);
}
/*function xmatrix_stack_push(...) {
	ds_queue_enqueue(global.__xdrawQueue, 1, ..., __EXEC_xmatrix_stack_push);
}*/
function __EXEC_xmatrix_stack_pop() {
	matrix_stack_pop();
}
function xmatrix_stack_pop() {
	ds_queue_enqueue(global.__xdrawQueue, 0, __EXEC_xmatrix_stack_pop);
}
function __EXEC_xmatrix_stack_set() {
	matrix_stack_set(global.__xdrawArgumentList[|0]);
}
function xmatrix_stack_set(matrix) {
	ds_queue_enqueue(global.__xdrawQueue, 1, matrix, __EXEC_xmatrix_stack_set);
}
function __EXEC_xmatrix_stack_clear() {
	matrix_stack_clear();
}
function xmatrix_stack_clear() {
	ds_queue_enqueue(global.__xdrawQueue, 0, __EXEC_xmatrix_stack_clear);
}
function __EXEC_xmatrix_stack_top() {
	matrix_stack_top();
}
function xmatrix_stack_top() {
	ds_queue_enqueue(global.__xdrawQueue, 0, __EXEC_xmatrix_stack_top);
}
function __EXEC_xmatrix_stack_is_empty() {
	matrix_stack_is_empty();
}
function xmatrix_stack_is_empty() {
	ds_queue_enqueue(global.__xdrawQueue, 0, __EXEC_xmatrix_stack_is_empty);
}
function __EXEC_xdraw_enable_drawevent() {
	draw_enable_drawevent(global.__xdrawArgumentList[|0]);
}
function xdraw_enable_drawevent(enable) {
	ds_queue_enqueue(global.__xdrawQueue, 1, enable, __EXEC_xdraw_enable_drawevent);
}
function __EXEC_xdraw_enable_swf_aa() {
	draw_enable_swf_aa(global.__xdrawArgumentList[|0]);
}
function xdraw_enable_swf_aa(enable) {
	ds_queue_enqueue(global.__xdrawQueue, 1, enable, __EXEC_xdraw_enable_swf_aa);
}
function __EXEC_xdraw_set_swf_aa_level() {
	draw_set_swf_aa_level(global.__xdrawArgumentList[|0]);
}
function xdraw_set_swf_aa_level(aa_level) {
	ds_queue_enqueue(global.__xdrawQueue, 1, aa_level, __EXEC_xdraw_set_swf_aa_level);
}
function __EXEC_xdraw_get_swf_aa_level() {
	draw_get_swf_aa_level();
}
function xdraw_get_swf_aa_level() {
	ds_queue_enqueue(global.__xdrawQueue, 0, __EXEC_xdraw_get_swf_aa_level);
}
function __EXEC_xdraw_texture_flush() {
	draw_texture_flush();
}
function xdraw_texture_flush() {
	ds_queue_enqueue(global.__xdrawQueue, 0, __EXEC_xdraw_texture_flush);
}
function __EXEC_xdraw_flush() {
	draw_flush();
}
function xdraw_flush() {
	ds_queue_enqueue(global.__xdrawQueue, 0, __EXEC_xdraw_flush);
}
function __EXEC_xdraw_light_define_ambient() {
	draw_light_define_ambient(global.__xdrawArgumentList[|0]);
}
function xdraw_light_define_ambient(col) {
	ds_queue_enqueue(global.__xdrawQueue, 1, col, __EXEC_xdraw_light_define_ambient);
}
function __EXEC_xdraw_light_define_direction() {
	draw_light_define_direction(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4]);
}
function xdraw_light_define_direction(ind, dx, dy, dz, col) {
	ds_queue_enqueue(global.__xdrawQueue, 5, ind, dx, dy, dz, col, __EXEC_xdraw_light_define_direction);
}
function __EXEC_xdraw_light_define_point() {
	draw_light_define_point(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5]);
}
function xdraw_light_define_point(ind, x, y, z, range, col) {
	ds_queue_enqueue(global.__xdrawQueue, 6, ind, x, y, z, range, col, __EXEC_xdraw_light_define_point);
}
function __EXEC_xdraw_light_enable() {
	draw_light_enable(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1]);
}
function xdraw_light_enable(ind, enable) {
	ds_queue_enqueue(global.__xdrawQueue, 2, ind, enable, __EXEC_xdraw_light_enable);
}
function __EXEC_xdraw_set_lighting() {
	draw_set_lighting(global.__xdrawArgumentList[|0]);
}
function xdraw_set_lighting(enable) {
	ds_queue_enqueue(global.__xdrawQueue, 1, enable, __EXEC_xdraw_set_lighting);
}
function __EXEC_xdraw_light_get_ambient() {
	draw_light_get_ambient();
}
function xdraw_light_get_ambient() {
	ds_queue_enqueue(global.__xdrawQueue, 0, __EXEC_xdraw_light_get_ambient);
}
function __EXEC_xdraw_light_get() {
	draw_light_get(global.__xdrawArgumentList[|0]);
}
function xdraw_light_get(ind) {
	ds_queue_enqueue(global.__xdrawQueue, 1, ind, __EXEC_xdraw_light_get);
}
function __EXEC_xdraw_get_lighting() {
	draw_get_lighting();
}
function xdraw_get_lighting() {
	ds_queue_enqueue(global.__xdrawQueue, 0, __EXEC_xdraw_get_lighting);
}
function __EXEC_xphysics_world_draw_debug() {
	physics_world_draw_debug(global.__xdrawArgumentList[|0]);
}
function xphysics_world_draw_debug(draw_flags) {
	ds_queue_enqueue(global.__xdrawQueue, 1, draw_flags, __EXEC_xphysics_world_draw_debug);
}
function __EXEC_xphysics_draw_debug() {
	physics_draw_debug();
}
function xphysics_draw_debug() {
	ds_queue_enqueue(global.__xdrawQueue, 0, __EXEC_xphysics_draw_debug);
}
function __EXEC_xphysics_particle_draw() {
	physics_particle_draw(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3]);
}
function xphysics_particle_draw(typemask, category, sprite, subimg) {
	ds_queue_enqueue(global.__xdrawQueue, 4, typemask, category, sprite, subimg, __EXEC_xphysics_particle_draw);
}
function __EXEC_xphysics_particle_draw_ext() {
	physics_particle_draw_ext(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7], global.__xdrawArgumentList[|8]);
}
function xphysics_particle_draw_ext(typemask, category, sprite, subimg, xscale, yscale, angle, col, alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 9, typemask, category, sprite, subimg, xscale, yscale, angle, col, alpha, __EXEC_xphysics_particle_draw_ext);
}
function __EXEC_xbuffer_get_surface() {
	buffer_get_surface(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2]);
}
function xbuffer_get_surface(buffer, surface, offset) {
	ds_queue_enqueue(global.__xdrawQueue, 3, buffer, surface, offset, __EXEC_xbuffer_get_surface);
}
function __EXEC_xbuffer_set_surface() {
	buffer_set_surface(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2]);
}
function xbuffer_set_surface(buffer, surface, offset) {
	ds_queue_enqueue(global.__xdrawQueue, 3, buffer, surface, offset, __EXEC_xbuffer_set_surface);
}
function __EXEC_xshader_set_uniform_matrix() {
	shader_set_uniform_matrix(global.__xdrawArgumentList[|0]);
}
function xshader_set_uniform_matrix(uniform_id) {
	ds_queue_enqueue(global.__xdrawQueue, 1, uniform_id, __EXEC_xshader_set_uniform_matrix);
}
function __EXEC_xshader_set_uniform_matrix_array() {
	shader_set_uniform_matrix_array(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1]);
}
function xshader_set_uniform_matrix_array(uniform_id, array) {
	ds_queue_enqueue(global.__xdrawQueue, 2, uniform_id, array, __EXEC_xshader_set_uniform_matrix_array);
}
function __EXEC_xskeleton_collision_draw_set() {
	skeleton_collision_draw_set(global.__xdrawArgumentList[|0]);
}
function xskeleton_collision_draw_set(val) {
	ds_queue_enqueue(global.__xdrawQueue, 1, val, __EXEC_xskeleton_collision_draw_set);
}
function __EXEC_xdraw_skeleton() {
	draw_skeleton(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7], global.__xdrawArgumentList[|8], global.__xdrawArgumentList[|9], global.__xdrawArgumentList[|10]);
}
function xdraw_skeleton(sprite, animname, skinname, frame, x, y, xscale, yscale, rot, col, alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 11, sprite, animname, skinname, frame, x, y, xscale, yscale, rot, col, alpha, __EXEC_xdraw_skeleton);
}
function __EXEC_xdraw_skeleton_time() {
	draw_skeleton_time(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7], global.__xdrawArgumentList[|8], global.__xdrawArgumentList[|9], global.__xdrawArgumentList[|10]);
}
function xdraw_skeleton_time(sprite, animname, skinname, time, x, y, xscale, yscale, rot, col, alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 11, sprite, animname, skinname, time, x, y, xscale, yscale, rot, col, alpha, __EXEC_xdraw_skeleton_time);
}
function __EXEC_xdraw_skeleton_instance() {
	draw_skeleton_instance(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7], global.__xdrawArgumentList[|8], global.__xdrawArgumentList[|9], global.__xdrawArgumentList[|10]);
}
function xdraw_skeleton_instance(instance, animname, skinname, frame, x, y, xscale, yscale, rot, col, alpha) {
	ds_queue_enqueue(global.__xdrawQueue, 11, instance, animname, skinname, frame, x, y, xscale, yscale, rot, col, alpha, __EXEC_xdraw_skeleton_instance);
}
function __EXEC_xdraw_skeleton_collision() {
	draw_skeleton_collision(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4], global.__xdrawArgumentList[|5], global.__xdrawArgumentList[|6], global.__xdrawArgumentList[|7], global.__xdrawArgumentList[|8]);
}
function xdraw_skeleton_collision(sprite, animname, frame, x, y, xscale, yscale, rot, col) {
	ds_queue_enqueue(global.__xdrawQueue, 9, sprite, animname, frame, x, y, xscale, yscale, rot, col, __EXEC_xdraw_skeleton_collision);
}
function __EXEC_xdraw_enable_skeleton_blendmodes() {
	draw_enable_skeleton_blendmodes(global.__xdrawArgumentList[|0]);
}
function xdraw_enable_skeleton_blendmodes(enable) {
	ds_queue_enqueue(global.__xdrawQueue, 1, enable, __EXEC_xdraw_enable_skeleton_blendmodes);
}
function __EXEC_xdraw_get_enable_skeleton_blendmodes() {
	draw_get_enable_skeleton_blendmodes();
}
function xdraw_get_enable_skeleton_blendmodes() {
	ds_queue_enqueue(global.__xdrawQueue, 0, __EXEC_xdraw_get_enable_skeleton_blendmodes);
}
function __EXEC_xlayer_force_draw_depth() {
	layer_force_draw_depth(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1]);
}
function xlayer_force_draw_depth(force, depth) {
	ds_queue_enqueue(global.__xdrawQueue, 2, force, depth, __EXEC_xlayer_force_draw_depth);
}
function __EXEC_xlayer_is_draw_depth_forced() {
	layer_is_draw_depth_forced();
}
function xlayer_is_draw_depth_forced() {
	ds_queue_enqueue(global.__xdrawQueue, 0, __EXEC_xlayer_is_draw_depth_forced);
}
function __EXEC_xdraw_tilemap() {
	draw_tilemap(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2]);
}
function xdraw_tilemap(tilemap_element_id, x, y) {
	ds_queue_enqueue(global.__xdrawQueue, 3, tilemap_element_id, x, y, __EXEC_xdraw_tilemap);
}
function __EXEC_xdraw_tile() {
	draw_tile(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1], global.__xdrawArgumentList[|2], global.__xdrawArgumentList[|3], global.__xdrawArgumentList[|4]);
}
function xdraw_tile(tileset, tiledata, frame, x, y) {
	ds_queue_enqueue(global.__xdrawQueue, 5, tileset, tiledata, frame, x, y, __EXEC_xdraw_tile);
}
function __EXEC_xcamera_set_view_mat() {
	camera_set_view_mat(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1]);
}
function xcamera_set_view_mat(camera, matrix) {
	ds_queue_enqueue(global.__xdrawQueue, 2, camera, matrix, __EXEC_xcamera_set_view_mat);
}
function __EXEC_xcamera_set_proj_mat() {
	camera_set_proj_mat(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1]);
}
function xcamera_set_proj_mat(camera, matrix) {
	ds_queue_enqueue(global.__xdrawQueue, 2, camera, matrix, __EXEC_xcamera_set_proj_mat);
}
function __EXEC_xview_get_surface_id() {
	view_get_surface_id(global.__xdrawArgumentList[|0]);
}
function xview_get_surface_id(view) {
	ds_queue_enqueue(global.__xdrawQueue, 1, view, __EXEC_xview_get_surface_id);
}
function __EXEC_xview_set_surface_id() {
	view_set_surface_id(global.__xdrawArgumentList[|0], global.__xdrawArgumentList[|1]);
}
function xview_set_surface_id(view, surface_id) {
	ds_queue_enqueue(global.__xdrawQueue, 2, view, surface_id, __EXEC_xview_set_surface_id);
}