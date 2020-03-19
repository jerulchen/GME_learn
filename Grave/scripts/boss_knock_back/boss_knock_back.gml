move_and_colide(knockback_speed, 0 );
var knockback_friction = 0.175  //击退摩擦力
knockback_speed = approach(knockback_speed, 0, knockback_friction);