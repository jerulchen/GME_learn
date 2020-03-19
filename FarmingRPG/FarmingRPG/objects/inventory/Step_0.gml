

if keyboard_check_pressed(ord("I"))
{
	show_inventory = !show_inventory;
}

if !show_inventory exit;


#region mouse hover slot
mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

var cell_xbuff = (cellSize + x_buffer) * scale;
var cell_ybuff = (cellSize + y_buffer) * scale;

var i_mousex = mousex - slot_x;
var i_mousey = mousey - slot_y;


var nx = i_mousex div cell_xbuff;
var ny = i_mousey div cell_ybuff;

var mouse_in_inventory = true;
if nx >= 0 && nx < inv_slots_width && ny >= 0 && ny < inv_slots_height
{
	var sx = i_mousex - (nx * cell_xbuff);
	var sy = i_mousey - (ny * cell_ybuff); 
	if (sx < cellSize * scale) && (sy < cellSize * scale)
	{
		m_slotx = nx;
		m_sloty = ny;
	}
}
else
{
	mouse_in_inventory = false;
}

//set selected slot to mouse position 

selected_slot = min(inv_slots -1, m_slotx + (m_sloty * inv_slots_width));

#endregion

//pickup item

var inv_grid = ds_inventory;
var ss_item = inv_grid[# 0, selected_slot];
var create_notification = false;

if pickup_slot != -1
{
	if mouse_check_button_pressed(mb_left)
	{
		if !mouse_in_inventory
		{
			#region drop item into game world
			create_notification = true;
			
			
			var pitem = inv_grid[# 0, pickup_slot];
			var in = pitem;
			inv_grid[# 1, pickup_slot] -= 1;
			//destroy tiem in inventory if it was the last one
			if inv_grid[# 1,pickup_slot] == 0 
			{
				inv_grid[# 0,pickup_slot] = item.noone;
				pickup_slot = -1;
			}
		
			//create the item
			var inst = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_item);
			with(inst)
			{
				item_num = pitem;
				x_frame = item_num mod (spr_width / cellSize);
				y_frame = item_num div (spr_width / cellSize);
			}
			#endregion
		}
		else if ss_item == item.noone
		{
			inv_grid[# 0, selected_slot] = inv_grid[# 0, pickup_slot];
			inv_grid[# 1, selected_slot] = inv_grid[# 1, pickup_slot];
			
			inv_grid[# 0, pickup_slot] = item.noone;
			inv_grid[# 1, pickup_slot] = 0;
			
			pickup_slot = -1;
			
		}
		else if ss_item == inv_grid[# 0, pickup_slot]
		{
			if selected_slot != pickup_slot
			{
				inv_grid[# 1, selected_slot] += inv_grid[# 1, pickup_slot];
			
				inv_grid[# 0, pickup_slot] = item.noone;
				inv_grid[# 1, pickup_slot] = 0;
			}
			
			pickup_slot = -1;
			
		}
		else
		{
			var ss_item_num = inv_grid[# 1, selected_slot];
			inv_grid[# 0, selected_slot] = inv_grid[# 0, pickup_slot];
			inv_grid[# 1, selected_slot] = inv_grid[# 1, pickup_slot];
			
			inv_grid[# 0, pickup_slot] = ss_item;
			inv_grid[# 1, pickup_slot] = ss_item_num;
			
			
		}
		
	}
}

else if ss_item != item.noone
{
	
	//drop item into game world
	if keyboard_check_pressed(vk_space)
	{
		create_notification = true;
		var in = inv_grid[# 0,selected_slot];
		
		inv_grid[# 1, selected_slot] -= 1;
		//destroy tiem in inventory if it was the last one
		if inv_grid[# 1,selected_slot] == 0 
		{
			inv_grid[# 0,selected_slot] = item.noone;
		}
		
		//create the item
		var inst = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_item);
		with(inst)
		{
			item_num = ss_item;
			x_frame = item_num mod (spr_width / cellSize);
			y_frame = item_num div (spr_width / cellSize);
		}
	}
	
	//drop pickup item into new slot
	if mouse_check_button_pressed(mb_right)
	{
		pickup_slot = selected_slot;
	}
}

if create_notification
{

	#region create notificaion
	if !instance_exists(obj_notification)
	{
		instance_create_layer(0, 0, "Instances", obj_notification);
	}
				

	with(obj_notification)
	{
		if !ds_exists(ds_notifications, ds_type_grid)
		{
			ds_notifications = ds_grid_create(2, 1);
			var not_grid = ds_notifications;
			not_grid[# 0, 0] = -1;
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
					not_grid[# 0,yy] -= 1;
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
}