if drop_move
{
	x = lerp(x, goal_x, 0.1);
	y = lerp(y, goal_y, 0.1);
	if abs(x - goal_x) < 1 && abs(y - goal_y) < 1 { drop_move = false; }
}
else
{
	if !keyboard_check(ord("O")){exit;}  //for debug
	var px = obj_player.x;
	var py = obj_player.y;
	
	var r = 32;
	
	if point_in_rectangle(px, py, x-r, y-r, x+r, y+r)
	{
		//are we on the of the layer?
		r = 2;
		if !point_in_rectangle(px, py, x-r, y-r, x+r, y+r)
		{
			//move towards the player
			x = lerp(x, px, 0.1);
			y = lerp(y, py, 0.1);
		}
		else
		{
			//pick up the item
			var in = item_num;
			with(inventory)
			{
				
				
				var ds_inv = ds_inventory;
				var picked_up = false;
				//check if the  item exists in inventory
				var yy = 0;
				repeat(inv_slots)
				{
					if ds_inv[# 0,yy] == in
					{
						ds_inv[# 1,yy] += 1;
						picked_up = true;
						break;
					}
					else
					{
						yy += 1;
					}
				}
				
				//otherwise, add item to an empty slot if  there is one
				if !picked_up
				{
					var yy = 0;
					repeat(inv_slots)
					{
						if ds_inv[# 0,yy] == item.noone
						{
							ds_inv[# 0,yy] = in;
							ds_inv[# 1,yy] += 1;
							picked_up = true;
							break;
						}
						else
						{
							yy += 1;
						}
					}
				}
				
				
				
				
			}
			//DESTORY ITEM IF PICKED UP
			if picked_up
			{
				#region create notificaion
				if !instance_exists(obj_notification)
				{
					instance_create_layer(0, 0, "Instances", obj_notification);
				}
				
				var in = item_num;
				with(obj_notification)
				{
					if !ds_exists(ds_notifications, ds_type_grid)
					{
						ds_notifications = ds_grid_create(2, 1);
						var not_grid = ds_notifications;
						not_grid[# 0, 0] = 1;
						not_grid[# 1, 0] = inventory.ds_item_info[# 0, in];
					}
					else //add to grid
					{
						event_perform(ev_other, ev_user0);
						var not_grid = ds_notifications;
						var grid_height = ds_grid_height(not_grid);
						var name = inventory.ds_item_info[# 0, in];
						var in_grid = false;
							
							
						var yy = 0;
						repeat(grid_height)
						{
							if name == not_grid[# 1,yy]
							{
								not_grid[# 0,yy] += 1;
								in_grid = true;
								break;
							}
							yy++;
						}
						if !in_grid
						{
							ds_grid_resize(not_grid, 2, grid_height+1);
							not_grid[# 0, grid_height] = 1; //this var haven't refresh in this frame/step
							not_grid[# 1, grid_height] = inventory.ds_item_info[# 0, in];
						}
					}
				}
				
				
				#endregion
				instance_destroy();
					
			}
			
		}
	}
}