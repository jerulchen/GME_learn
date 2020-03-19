///@arg death_sprite
var death_sprite = argument0;
set_state_sprite(death_sprite,0.25, 0);
friction = true;


//这里不用animation_end脚本，因为脚本调用了image_speed参数作为判断标准，但是这个参数在这里被设置为0，导致条件只会被满足一次
if image_index >= image_number -1
{
	image_index = image_number - 1;
	image_speed = 0;
	if image_alpha > 0
	{
		image_alpha -= 0.1;
		
	}
	else
	{
		instance_destroy();
	}
}

move_and_colide(knockback_speed, 0 );
var knockback_friction = 0.175  //击退摩擦力
knockback_speed = approach(knockback_speed, 0, knockback_friction);