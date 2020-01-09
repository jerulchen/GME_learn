/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 3FD1FE71
/// @DnDArgument : "xpos_relative" "1"
/// @DnDArgument : "ypos_relative" "1"
/// @DnDArgument : "var" "newBullet"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "objectid" "obj_bullet"
/// @DnDSaveInfo : "objectid" "75fbc290-b225-4e5c-a3d6-dcc040e244a3"
var newBullet = instance_create_layer(x + 0, y + 0, "Instances", obj_bullet);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 5920EAF2
/// @DnDArgument : "expr" "image_angle"
/// @DnDArgument : "var" "newBullet.direction"
newBullet.direction = image_angle;