/// @description Insert description here
// You can write your code in this editor

vspeed *= -1;
var _s = speed;
var _dir = point_direction(other.x, other.y + 32, x, y );
var _dist = point_distance(x,y, other.x, other.y + 32);

motion_add(_dir, _dist / 5);
speed = _s;
