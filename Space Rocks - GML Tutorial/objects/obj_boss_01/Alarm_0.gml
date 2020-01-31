/// @description Insert description here
// You can write your code in this editor

var inst_bullet_boss = instance_create_layer(x,y,"Instances",obj_bullet_boss_1);
inst_bullet_boss.direction = image_angle;
inst_bullet_boss.image_angle = image_angle;

alarm [0]= room_speed * 2;