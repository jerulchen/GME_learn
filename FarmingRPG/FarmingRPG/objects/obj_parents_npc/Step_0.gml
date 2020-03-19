
if !can_move exit;
//collide logic
#region collide test

if instance_exists(obj_block) 
{
	if moveX != 0
	{
		var collisionH = instance_place(x + moveX, y, obj_block)
		if collisionH != noone && collisionH.collideable == true
		{
			repeat(abs(moveX))
			{
				if !place_meeting(x + sign(moveX), y, obj_block)
				{
					x += sign(moveX)
				}
				else
				{
					break;
				}
			}
		
			moveX = 0;
		}
	}
	if moveY != 0
	{
		var collisionV = instance_place(x, y + moveY, obj_block)
		if collisionV != noone && collisionV.collideable == true
		{
			repeat(abs(moveY))
			{
				if !place_meeting(x , y+ sign(moveY), obj_block)
				{
					y += sign(moveY)
				}
				else
				{
					break;
				}
			}
		
			moveY = 0;
		}
	}
}

#endregion

//show_debug_message(string(input_right)+" & " + string(input_left));

x += moveX;
y += moveY;