/// @DnDAction : YoYo Games.Movement.Wrap_Room
/// @DnDVersion : 1
/// @DnDHash : 600B99F7
/// @DnDArgument : "margin" "sprite_width/2"
move_wrap(1, 1, sprite_width/2);

/// @DnDAction : YoYo Games.Instances.Sprite_Rotate
/// @DnDVersion : 1
/// @DnDHash : 3896CB8B
/// @DnDArgument : "angle" "1"
/// @DnDArgument : "angle_relative" "1"
image_angle += 1;

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 495C6B6D
/// @DnDArgument : "var" "image_xscale"
/// @DnDArgument : "op" "3"
/// @DnDArgument : "value" "1.3"
if(image_xscale <= 1.3)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 7037A0B5
	/// @DnDParent : 495C6B6D
	/// @DnDArgument : "expr" "-0.005"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "image_xscale"
	image_xscale += -0.005;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 0E885158
	/// @DnDParent : 495C6B6D
	/// @DnDArgument : "expr" "-0.005"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "image_yscale"
	image_yscale += -0.005;
}

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 30A889DF
/// @DnDArgument : "var" "image_xscale"
/// @DnDArgument : "op" "4"
/// @DnDArgument : "value" "0.7"
if(image_xscale >= 0.7)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 3C8442CC
	/// @DnDParent : 30A889DF
	/// @DnDArgument : "expr" "0.005"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "image_xscale"
	image_xscale += 0.005;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 4271DB14
	/// @DnDParent : 30A889DF
	/// @DnDArgument : "expr" "0.005"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "image_yscale"
	image_yscale += 0.005;
}