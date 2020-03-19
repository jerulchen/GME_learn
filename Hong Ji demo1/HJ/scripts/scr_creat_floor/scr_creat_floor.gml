with(obj_wall)instance_destroy();

for(var j=0; j < room_height / 64; j++)
{
	for(var i=0; i < room_width / 64 ; i++)
	{
		if(!collision_point(i*64, j*64, obj_floor, 0, 0))
		{
			instance_create_depth(i*64, j*64, 1 , obj_wall);
		}
	}
}