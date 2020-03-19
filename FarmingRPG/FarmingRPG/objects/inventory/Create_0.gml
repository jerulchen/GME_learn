depth = -1;
scale = 1;

show_inventory = false;

inv_slots = 17;
inv_slots_width = 8;
inv_slots_height = 3;

selected_slot = 0;
pickup_slot = -1;
m_slotx = 0;
m_sloty = 0;


x_buffer = 2; //the buffer between the nearest two slots
y_buffer = 4;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();



cellSize = 32;

inv_UI_width = 288;
inv_UI_height = 192;

spr_inv_UI = spr_inventory_UI;
spr_inv_items = spr_inventory_items;

spr_inv_items_columns = sprite_get_width(spr_inv_items) / cellSize;
spr_inv_items_rows = sprite_get_height(spr_inv_items) / cellSize;


inv_UI_x = (gui_width * 0.5) - (inv_UI_width * 0.5 * scale);
inv_UI_y = (gui_height * 0.5) - (inv_UI_height * 0.5 * scale);

info_x = inv_UI_x + (9 * scale);
info_y = inv_UI_y + (9 * scale);

slot_x = info_x;
slot_y = inv_UI_y + (40 * scale);

desc_x = info_x;
desc_y = inv_UI_y + (156 * scale);


//---player info
//0  =  gold;
//1 = silver;
//2 = bronze;
//3 = name;

ds_player_info = ds_grid_create(2,4);

var info_grid = ds_player_info;
info_grid[# 0,0] = "Gold";
info_grid[# 0,1] = "Silver";
info_grid[# 0,2] = "Bronze";
info_grid[# 0,3] = "Name";

info_grid[# 1,0] = irandom_range(0,99);
info_grid[# 1,1] = irandom_range(0,99);
info_grid[# 1,2] = irandom_range(0,99);
info_grid[# 1,3] = "Player";


// ds_inventory
//0 = item
//1 = number

ds_inventory = ds_grid_create(2, inv_slots);

// items

enum item
{
	noone = 0,
	tomato = 1,
	potato = 2,
	carrot = 3,
	artichoke = 4,
	chilli = 5,
	gourd = 6,
	corn = 7,
	wood = 8,
	stone = 9,
	bucket = 10,
	chair = 11,
	picture = 12,
	axe = 13,
	potion = 14,
	starfish = 15,
	mushroom = 16,
	height = 17
	
}

#region create item info grid
ds_item_info = ds_grid_create(2, item.height)

// item names

var z = 0, i = 0;
ds_item_info[# z, i++] = "Nothing";
ds_item_info[# z, i++] = "tomato";
ds_item_info[# z, i++] = "potato";
ds_item_info[# z, i++] = "carrot";
ds_item_info[# z, i++] = "artichoke";
ds_item_info[# z, i++] = "chilli";
ds_item_info[# z, i++] = "gourd";
ds_item_info[# z, i++] = "corn";
ds_item_info[# z, i++] = "wood";
ds_item_info[# z, i++] = "stone";
ds_item_info[# z, i++] = "bucket";
ds_item_info[# z, i++] = "chair";
ds_item_info[# z, i++] = "picture";
ds_item_info[# z, i++] = "axe";
ds_item_info[# z, i++] = "potion";
ds_item_info[# z, i++] = "starfish";
ds_item_info[# z, i++] = "mushroom";

// Item descriptions

var z = 1, i = 0;
ds_item_info[# z, i++] = "Nothing";
ds_item_info[# z, i++] = "tomato";
ds_item_info[# z, i++] = "potato";
ds_item_info[# z, i++] = "carrot";
ds_item_info[# z, i++] = "artichoke";
ds_item_info[# z, i++] = "chilli";
ds_item_info[# z, i++] = "gourd";
ds_item_info[# z, i++] = "corn";
ds_item_info[# z, i++] = "wood";
ds_item_info[# z, i++] = "stone";
ds_item_info[# z, i++] = "bucket";
ds_item_info[# z, i++] = "chair";
ds_item_info[# z, i++] = "picture";
ds_item_info[# z, i++] = "axe";
ds_item_info[# z, i++] = "potion";
ds_item_info[# z, i++] = "starfish";
ds_item_info[# z, i++] = "mushroom";


#endregion

var yy = 0;
repeat(inv_slots)
{
	ds_inventory[# 0, yy] = irandom_range(1, item.height - 1);
	ds_inventory[# 1, yy] = irandom_range(1, 10);
	
	
	yy += 1;
}
