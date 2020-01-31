/// @description Insert description here
// You can write your code in this editor

var bullet_boss_amt = 10;
var bullet_boss_angle = 120;

var i ;
for (i= 0 ;i < bullet_boss_amt ; i++ )
{
var inst_boss_bulletnor = instance_create_layer(x,y,"Instances",obj_bullet_enemy_1);
inst_boss_bulletnor.image_angle = image_angle - ( bullet_boss_angle / 2 ) + i * (bullet_boss_angle / (bullet_boss_amt - 1 ))
inst_boss_bulletnor.direction = inst_boss_bulletnor.image_angle

}

alarm [1] = room_speed * 5;