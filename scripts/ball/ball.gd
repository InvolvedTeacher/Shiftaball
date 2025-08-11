extends RigidBody2D

var reset: bool

func _ready() -> void:
	reset_ball()

func reset_ball() -> void:
	visible = false
	position.x = -100
	position.y = -100
	reset = true
	pass
