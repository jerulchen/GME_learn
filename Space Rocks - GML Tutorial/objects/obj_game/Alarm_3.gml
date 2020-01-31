/// @description Insert description here
// You can write your code in this editor
if (room = rm_game || room = rm_boss)
{
	if (instance_number(obj_enemy_1) < 4 )
	{
			if(choose(0,1) == 0)
			{
				var xx = choose (0 , room_width);
				var yy = irandom_range (0, room_height);
				var inst_enemy = instance_create_layer(xx,yy,"Instances",obj_enemy_1);
			
			
			
			}
			else
			{
				var xx = irandom_range (0,room_width);
				var yy = choose (0, room_height);
				var inst_enemy = instance_create_layer(xx,yy,"Instances",obj_enemy_1);
			}
		
			inst_enemy.direction = irandom_range(0,359);

		}	
		alarm[3] = room_speed * 5;
	
}