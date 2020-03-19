if !instance_exists(o_skeleton) exit;
		
		image_xscale = sign(o_skeleton.x - x);
		if image_xscale == 0
		{
			image_xscale = 1;
		
		}
		
		var direction_facing = image_xscale;
		var distance_to_player = point_distance(x, y, o_skeleton.x, o_skeleton.y);
		if distance_to_player <= attack_range
		{
			state = "attack";
		}
		else
		{
			move_and_colide(direction_facing * chase_speed, 0);
			
		}