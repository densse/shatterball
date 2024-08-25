var _input = rollback_get_input();

draw_self();
draw_rectangle(x, y, x + bashes*20, y+10, false);
if(bashing)
{
	var _dir = point_direction(x, y, _input.mouseX, _input.mouseY);
	draw_sprite_ext(sArrow, (50-bashing)/10, bashX, bashY, 1, 1, _dir, -1, image_alpha);
}