scr_get_input();


spd = nor_speed;
moveX = 0;
moveY = 0;
if !move_camera
{
	if input_run || input_walk 
	{
		spd = abs(input_run * run_speed - input_walk * walk_speed);
	}
	else
	{
		spd = nor_speed;
	}

	if input_left || input_right
	{
		moveX = input_right * spd - input_left * spd;
	}
	else
	{
		moveY = input_down * spd - input_up * spd;
	}
}

//get player facing
if moveX != 0
{
	switch sign(moveX)
	{
		case 1 : facing = dir.right; break;
		case -1 : facing = dir.left; break;
	}

}
else if (moveY != 0)
{
	switch sign(moveY)
	{
		case 1: facing = dir.down; break;
		case -1: facing = dir.up; break;
	}
}
else
{
	facing = -1;
}

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


//Objects
var inst = instance_place(x,y, obj_transition);
if inst != noone && facing == inst.playerFacingBefore
{
	with(game)
	{
		if !doTransition
		{
			spawnRoom = inst.targetRoom;	
			spawnX = inst.targetX;
			spawnY = inst.targetY;
			spawnPlayerFacing = inst.playerFacingAfter
			doTransition = true;
			//show_debug_message(string(spawnRoom))
		}
	}
}

//Textbox
if input_interact
{
	if active_textbox == noone
	{
	
		var inst = collision_rectangle(x-radius, y-radius, x+radius, y+radius, obj_parents_npc, false, false)
	
		if inst != noone
		{
			with(inst)
			{
				var tbox =  create_textbox(text, speakers);
				can_move = false;
				moveX = 0; moveY = 0;
			}
			active_textbox = tbox;
		}
	}
	else
	{
		if !instance_exists(active_textbox)
		{
			active_textbox = noone;
		}
	}
	
	

}



x += moveX;
y += moveY;