x += random_range(-screenshake, screenshake);
y += random_range(-screenshake, screenshake);

if !instance_exists(o_skeleton) exit;

var target_x = o_skeleton.x
var target_y = o_skeleton.y

x = lerp(x, target_x, 0.1);
y = lerp(y, target_y, 0.1);



camera_set_view_pos(view_camera[0], x - width/2, y - height * 0.8);