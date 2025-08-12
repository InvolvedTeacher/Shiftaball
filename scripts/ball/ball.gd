extends RigidBody2D

var disabled: bool
var player: CharacterBody2D

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")
	disable_ball()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("reset"):
		disable_ball()
	if Input.is_action_just_pressed("throw"):
		throw_ball()

func disable_ball() -> void:
	hide()
	PhysicsServer2D.body_set_state(get_rid(), PhysicsServer2D.BODY_STATE_TRANSFORM,
			Transform2D.IDENTITY.translated(Vector2(-100, -100)))
	disabled = true

# throw_ball throws the ball only if it is currently disabled
func throw_ball() -> void:
	if not disabled:
		return
	PhysicsServer2D.body_set_state(get_rid(), PhysicsServer2D.BODY_STATE_TRANSFORM,
			Transform2D.IDENTITY.translated(player.position))
	PhysicsServer2D.body_set_state(get_rid(), PhysicsServer2D.BODY_STATE_LINEAR_VELOCITY,
			Vector2(500, -500)) # TODO: eliminate hard coded value
	show()
	disabled = false
