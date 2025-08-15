extends CollisionObject2D
class_name Bars

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func unlock() -> void:
	hide()
	collision_shape_2d.set_deferred("disabled", true)
