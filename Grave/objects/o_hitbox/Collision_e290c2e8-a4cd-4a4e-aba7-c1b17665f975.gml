
if creator = noone or creator == other or ds_list_find_index(hit_objects, other) != -1
{
	exit;
}
 
audio_play_sound(a_medium_hit,3,false);

var _x;
	var _y;
	
	if x <= other.x
	{
		_x = (bbox_right + other.bbox_left) / 2;
	}
	else
	{
		_x = (bbox_left + other.bbox_right) / 2;
	}
	
	if y <= other.y
	{
		_y = (bbox_bottom + other.bbox_top) /2;
	
	}
	else
	{
		_y = (bbox_top + other.bbox_bottom) /2;
	}
repeat(10)
{
	
	
	instance_create_layer(_x, _y, "Effects", o_hit_effect);

}

other.hp -= damage;

if instance_exists(o_skeleton)
{
	if creator.object_index = o_skeleton 
	{
		add_screenshake(2,4);
		other.alarm[0] = room_speed * 2;
		if   other.hp <= 0 && other.state != "death"
		{
			o_skeleton.kills += 1;
			//other.state = "death";
		}
		
	
	}
	
	//hit player
	if other.object_index == o_skeleton 
	{
		add_screenshake(4,8);
		if other.hp <= 0
		{
			var _num = sprite_get_number(s_skeleton_bones_strip10);
			
			for ( var i=0; i < _num; i++)
			{
				var bx = other.x + random_range(-8,8);
				var by = other.y + random_range(-24,8);
				var bone = instance_create_layer(bx, by, "Instances", o_skeleton_bone);
				bone.direction = 90 - (image_xscale * random_range(30, 60));
				bone.speed = random_range(3, 10);
				bone.image_index = i;
				if i == 5 bone.image_angle = 130;
				
			}
			ini_open("save.ini");
			ini_write_real("Scores", "Kills", other.kills);
			var highscore = ini_read_real("Scores", "Highscore", 0);
			if other.kills > highscore
			{
				ini_write_real("Scores", "Highscore", other.kills);
			
			}
			ini_close();
			
		}
		
		
	}
	
	//hit enemy

}


ds_list_add(hit_objects, other);

if other.state != "death" && other.superarmour != true
{
	other.state = "knockback";
}

other.knockback_speed = knockback * image_xscale;



//with other
//{
//	instance_destroy();

//}