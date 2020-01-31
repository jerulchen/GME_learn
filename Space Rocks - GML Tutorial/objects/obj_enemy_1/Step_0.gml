/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_ship))

{

image_angle = point_direction(x,y,obj_ship.x,obj_ship.y);
}
//else
//{
//image_angle = irandom_range(0,359);
//}
move_wrap(true,true,sprite_width / 2);