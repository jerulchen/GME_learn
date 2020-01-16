/// @DnDAction : YoYo Games.Common.Apply_To
/// @DnDVersion : 1
/// @DnDHash : 1083E5AF
/// @DnDApplyTo : 7eaf8bc0-6011-4b24-9af8-509f42e3e9c0
with(obj_game) {
	/// @DnDAction : YoYo Games.Instance Variables.Set_Lives
	/// @DnDVersion : 1
	/// @DnDHash : 2352F9D3
	/// @DnDParent : 1083E5AF
	/// @DnDArgument : "lives" "-1"
	/// @DnDArgument : "lives_relative" "1"
	if(!variable_instance_exists(id, "__dnd_lives")) __dnd_lives = 0;
	__dnd_lives += real(-1);

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 0BBFD68A
	/// @DnDInput : 2
	/// @DnDParent : 1083E5AF
	/// @DnDArgument : "expr" "obj_ship.x"
	/// @DnDArgument : "expr_1" "obj_ship.y"
	/// @DnDArgument : "var" "x_shipDestory"
	/// @DnDArgument : "var_1" "y_shipDestory"
	x_shipDestory = obj_ship.x;
	y_shipDestory = obj_ship.y;
}

/// @DnDAction : YoYo Games.Common.Apply_To
/// @DnDVersion : 1
/// @DnDHash : 7FB83DC1
/// @DnDApplyTo : other
with(other) {
	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 22E75B84
	/// @DnDParent : 7FB83DC1
	instance_destroy();
}

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 7C8C0BC6
instance_destroy();

/// @DnDAction : YoYo Games.Loops.Repeat
/// @DnDVersion : 1
/// @DnDHash : 09007C7D
/// @DnDArgument : "times" "30"
repeat(30)
{
	/// @DnDAction : YoYo Games.Instances.Create_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 06705738
	/// @DnDParent : 09007C7D
	/// @DnDArgument : "xpos_relative" "1"
	/// @DnDArgument : "ypos_relative" "1"
	/// @DnDArgument : "objectid" "obj_debris"
	/// @DnDSaveInfo : "objectid" "9e081d8a-1862-40af-b58a-a54719cbe990"
	instance_create_layer(x + 0, y + 0, "Instances", obj_debris);
}