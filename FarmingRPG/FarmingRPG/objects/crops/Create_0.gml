ds_crops_types = -1;
ds_crops_instances = -1;
ds_crops_data = ds_grid_create(4, 1);
ds_grid_clear(ds_crops_data, -1);

enum crop 
{
	tomato,
	potato,
	carrot,
	artichoke,
	chilli,
	gourd,
	corn
}

create_corp_type(4, 40, "tomato");  //tomato
create_corp_type(3, 35, "potato");  //potato
create_corp_type(2, 25, "carrot");  //carrot
create_corp_type(4, 45, "artichoke");  //artichoke
create_corp_type(3, 30, "chilli");  //chilli
create_corp_type(2, 20, "gourd");  //gourd
create_corp_type(5, 50, "corn");  //corn



planting = false;
selectCrop = 0;

mx = 0;
my = 0;


cellSize = 32;