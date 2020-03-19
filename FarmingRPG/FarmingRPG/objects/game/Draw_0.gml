
if (!debug) exit;
with (obj_block)
{
	if collideable = true
	{
		draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_yellow, c_yellow, c_yellow, c_yellow, true)
	}
	else
	{
		draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, c_blue, c_blue, c_blue, true)
	}
}

with (obj_player)
{
	if collideable = true
	{
		draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_yellow, c_yellow, c_yellow, c_yellow, true)
	}
	else
	{
		draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, c_blue, c_blue, c_blue, true)
	}
}

with (obj_parents_npc)
{
	if collideable = true
	{
		draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_yellow, c_yellow, c_yellow, c_yellow, true)
	}
	else
	{
		draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, c_blue, c_blue, c_blue, true)
	}
}

var xx = 0;
var cs = crops.cellSize

draw_set_alpha(0.3);

var r = roomWidth div cs;
repeat (r)
{
	draw_line_color(xx, 0, xx, room_height, c_white, c_white);
	xx += cs;
}


var yy = 0;
var r = roomHeight div cs;
repeat (r)
{
	draw_line_color(0, yy, room_width, yy , c_white, c_white);
	yy += cs;
}

draw_set_alpha(1);