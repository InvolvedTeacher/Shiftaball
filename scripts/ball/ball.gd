extends CharacterBody2D
class_name Ball

var disabled: bool
var player: CharacterBody2D

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")
	disable_ball()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("reset"):
		disable_ball()

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	velocity.x = move_toward(velocity.x, 0, delta)
	
	#move_and_slide()
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	if collision:
		var reflect = collision.get_remainder().bounce(collision.get_normal())
		velocity = velocity.bounce(collision.get_normal()) * 0.75
		move_and_collide(reflect)

func disable_ball() -> void:
	hide()
	position = Vector2(-100, -100)
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

func get_disabled() -> bool:
	return disabled
