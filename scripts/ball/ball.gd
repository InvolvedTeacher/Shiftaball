extends CharacterBody2D
class_name Ball

var disabled: bool
var player: CharacterBody2D
var small_ball_bounce: float = 0.75
var big_ball_bounce: float = 0.25
var small: bool

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")
	small = true
	disable_ball()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("reset"):
		disable_ball()
	if Input.is_action_just_pressed("shift_ball"):
		shift_ball()

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	velocity.x = move_toward(velocity.x, 0, delta)
	
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal()) * (
				small_ball_bounce if small else big_ball_bounce)

func disable_ball() -> void:
	hide()
	position = Vector2(-100, -100)
	if not small:
		shift_ball()
	disabled = true

# throw_ball throws the ball only if it is currently disabled
func throw_ball(strength: float) -> void:
	if not disabled:
		return
	var direction: Vector2 = (get_viewport().get_mouse_position() - player.position).normalized()
	position = player.position
	velocity = strength * direction
	show()
	disabled = false

func shift_ball() -> void:
	if disabled:
		return
	small = not small
	if small:
		scale = Vector2(0.2, 0.2)
	else:
		scale = Vector2(1, 1)

func get_disabled() -> bool:
	return disabled

func is_small() -> bool:
	return small
