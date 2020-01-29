/// @description Insert description here
// You can write your code in this editor
if(keyboard_check(vk_left) || keyboard_check(ord("A")))
{
image_angle = image_angle + 5;
}
if(keyboard_check(vk_right) || keyboard_check(ord("D")))
{
image_angle = image_angle - 5;
}

if (keyboard_check(vk_up) || keyboard_check(ord("W")))

{
	
	motion_add(image_angle, 0.05)
	
	
	
}

if (keyboard_check(vk_down)|| keyboard_check(ord("S")))
{
	
motion_add(image_angle, -0.05)
	
}
move_wrap(true, true , sprite_height / 2 );

if (keyboard_check_pressed(vk_space))
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
	
	var shotgun_amt = 10 ;
 	var shotgun_angle = 111 ;
	
	var i
	for (i = 0; i <= shotgun_amt;i++)
	{
	var inst = instance_create_layer(x,y,"Instances", obj_bullet_shotgun);
	inst.direction = image_angle-shotgun_angle/2 + i * shotgun_angle / (shotgun_amt - 1);
	inst.image_angle = inst.direction
	}
	
	}
	

}


