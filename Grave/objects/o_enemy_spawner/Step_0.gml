var enemy_count = instance_number(o_enemy_plarent);

var _view = view_get_camera(0);
var _w = camera_get_view_width(_view);
var _border = camera_get_view_border_x(_view);
var _viewrange = _w - _border

if instance_exists(o_skeleton) && enemy_count <= o_skeleton.kills / 4
{
	if enemy_count > 5
	{
		exit;
	}
	
	var enemy = choose(o_knight, o_crow, o_crow);
	if o_skeleton.kills > 20 && !instance_exists(o_boss)
	{
		enemy = choose(o_knight, o_knight, o_crow, o_crow, o_boss);
	}
	var new_x = random_range(220, room_width - 220);
	
	while point_distance(new_x, 0, o_skeleton.x , 0) < _viewrange * 1.5
	{
		new_x = random_range(220, room_width - 220);
	}
	
	instance_create_layer(new_x, o_skeleton.y, "Instances", enemy)
}



//show_debug_message(_viewrange)