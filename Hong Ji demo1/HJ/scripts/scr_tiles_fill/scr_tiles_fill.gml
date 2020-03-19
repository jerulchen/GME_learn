var tile_id = layer_get_id("Tiles_wall");
tile_id = layer_tilemap_get_id(tile_id);

for(var j = 0; j < room_height / 64 ; j++)
{
	for (var i = 0; i < room_width / 64 ; i++)
	{
		tilemap_set(tile_id,1,i,j);
	}
}