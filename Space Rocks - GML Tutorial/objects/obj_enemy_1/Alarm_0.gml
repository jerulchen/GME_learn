/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_ship)

{
var inst_enemy_bullet = instance_create_layer(x,y,"Instances",obj_bullet_enemy_1);

 inst_enemy_bullet.image_angle = point_direction(x,y,obj_ship.x,obj_ship.y);
 inst_enemy_bullet.direction = point_direction (x,y, obj_ship.x, obj_ship.y);
}
alarm [0] = room_speed;