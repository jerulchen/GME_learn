/// @description Insert description here
// You can write your code in this editor
//-------------坦克式移动-----------------


//if(keyboard_check(vk_left) || keyboard_check(ord("A")))
//{
//image_angle = image_angle + 5;
//}
//if(keyboard_check(vk_right) || keyboard_check(ord("D")))
//{
//image_angle = image_angle - 5;
//}

//if (keyboard_check(vk_up) || keyboard_check(ord("W")))

//{
	
//	motion_add(image_angle, 0.05)
	
	
	
//}

//if (keyboard_check(vk_down)|| keyboard_check(ord("S")))
//{
	
//motion_add(image_angle, -0.05)
	
//}

//-------------坦克式移动-------结束----------

if (keyboard_check(ord("W")))
{
	if(vspeed >= -3 )
	{
	 motion_add(90,0.08);
	}

}
if (keyboard_check(ord("S")))
{
	if(vspeed <=3)
	{
	 motion_add(270,0.08);
	}

}

if (keyboard_check(ord("A")))
{
	if(hspeed >= -3)
	{
	 motion_add(180,0.08);
	}

}

if (keyboard_check(ord("D")))
{
	if(hspeed <=3)
	{
	 motion_add(0,0.08);
	}

}

if (speed > 0)
{
speed -= 0.03

}
image_angle = point_direction(x,y,mouse_x,mouse_y);

move_wrap(true, true , sprite_height / 2 );

//if (keyboard_check_pressed(vk_space))
if(mouse_check_button_pressed(mb_left))
{
if(alarm[0] <= 0)
	{
		alarm[0] = 1
	
	}


}

if (mouse_check_button(mb_left))
{
	
	
	if(alarm[0] <= 0)
	{
		alarm[0] = room_speed / shootspd * 100 
	
	}
	
	//audio_play_sound(snd_zap,1,false);
	//switch(gun)
	//{
	//case "NORMAL" :
	//var inst = instance_create_layer(x,y,"Instances", obj_bullet);
	//inst.direction = image_angle;
	//inst.image_angle = image_angle;
	//break;
	
	//case "SHOTGUN" :
	//var inst = instance_create_layer(x,y,"Instances", obj_bullet_shotgun);
	//inst.direction = image_angle;
	//inst.image_angle = image_angle;
	
	//var shotgun_amt = 10 ;
 	//var shotgun_angle = 111 ;
	
	//var i
	//for (i = 0; i <= shotgun_amt;i++)
	//{
	//var inst = instance_create_layer(x,y,"Instances", obj_bullet_shotgun);
	//inst.direction = image_angle-shotgun_angle/2 + i * shotgun_angle / (shotgun_amt - 1);
	//inst.image_angle = inst.direction
	//}
	
	//}
	

}

if(alarm[1] <= 0)
	{
		alarm[1] = room_speed * 0.1
	
	}

if (mouse_check_button_pressed(mb_right))
{
	if (alarm[2] <= 0 )
	{
		instance_create_layer(x,y,"Instances",obj_shield);
		alarm[2] = skillcd * room_speed;
		alarm[3] = shielddur * room_speed;
	}
}
