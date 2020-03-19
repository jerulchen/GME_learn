if !instance_exists(other) exit;
var _dir = point_direction(other.x, other.y, x, y );
var acceleration = 0.5;

motion_add(_dir, acceleration)