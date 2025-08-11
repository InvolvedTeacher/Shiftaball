extends RigidBody2D

var disabled: bool

func _ready() -> void:
	disable_ball()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("reset"):
		disable_ball()
	if Input.is_action_just_pressed("throw"):
		throw_ball()

func disable_ball() -> void:
	visible = false
	position.x = -100
	position.y = -100
	disabled = true

# throw_ball throws the ball only if it is currently disabled
func throw_ball() -> void:
	if not disabled:
		return
	var player: CharacterBody2D = get_tree().get_first_node_in_group("Player")
	visible = true
	PhysicsServer2D.body_set_state(get_rid(), PhysicsServer2D.BODY_STATE_TRANSFORM,
			Transform2D.IDENTITY.translated(player.position))
	set_axis_velocity(Vector2(500, -500)) # TODO: Remove hard-coded elements.
	disabled = false
