/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_ship) && obj_ship.alarm[3] > 0)
{
x = obj_ship.x;
y = obj_ship.y;
}
else
{
instance_destroy();
}