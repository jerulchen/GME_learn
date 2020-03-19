width = camera_get_view_width( view_camera[0] );
height = camera_get_view_height( view_camera[0] );
screenshake = 0;

if !instance_exists(o_skeleton) exit;

var target_x = o_skeleton.x + random_range(-screenshake, screenshake);
var target_y = width / 2;

x = target_x;
y = target_y;

camera_set_view_pos(view_camera[0], x - width/2, y - height * 0.8);