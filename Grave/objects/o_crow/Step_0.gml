switch (state)
{
	case "chase":
		#region chase state
		if !instance_exists(o_skeleton) exit;
		if place_meeting(x, y, o_skeleton) && attacked = false && o_skeleton.state != "roll"
		{
			create_hitbox(x,y, self, sprite_index,knockback, 1, damage, image_xscale);
			attacked = true;
		}
		if attacked == true
		{
			vspeed = -1;
		}
		#endregion
		break;
	case "death":
		#region death state
		repeat(6)
		{
			instance_create_layer(x+random_range(-4,4),y-16+random_range(-4,4),"Effects", o_fether);
		}
		instance_destroy();
		
		
		#endregion
		break;














}