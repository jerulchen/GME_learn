/// @description Insert description here
// You can write your code in this editor

if (mouse_check_button(mb_left))
{
audio_play_sound(snd_zap,1,false);
	switch(gun)
	{
	case "NORMAL" :
	var inst = instance_create_layer(x,y,"Instances", obj_bullet);
	inst.direction = image_angle;
	inst.image_angle = image_angle;
	break;
	
	case "SHOTGUN" :
	var inst = instance_create_layer(x,y,"Instances", obj_bullet_shotgun);
	inst.direction = image_angle;
	inst.image_angle = image_angle;
	
	var sshotgun_amt = shotgun_amt + shotgun_level * shotgun_amt_step ;
 	var sshotgun_angle = shotgun_angle + shotgun_level * shotgun_angle_step ;
	
	var i
	for (i = 0; i <= sshotgun_amt - 2;i++)
	{
	var inst = instance_create_layer(x,y,"Instances", obj_bullet_shotgun);
	inst.direction = image_angle-sshotgun_angle/2 + i * sshotgun_angle / (sshotgun_amt - 1);
	inst.image_angle = inst.direction
	}
	
	}
	
}