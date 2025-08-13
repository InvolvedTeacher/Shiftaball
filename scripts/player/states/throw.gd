extends State
class_name PlayerStateThrow

var player: CharacterBody2D
@onready var timer: Timer = $Timer
var ball: Ball

func enter():
	ball = get_tree().get_first_node_in_group("Ball")
	if not ball.get_disabled():
		transitioned.emit(self, "PlayerStateIdle")
		return
	player = get_tree().get_first_node_in_group("Player")
	player.set_animation("throw")
	timer.start()

func update(_delta: float) -> void:
	if Input.is_action_just_released("throw"):
		player.set_animation("after_throw")
		var throw_strength = (1 - timer.time_left) * 800 + 200# TODO: remove hard coded values
		timer.stop()
		ball.throw_ball(throw_strength)
		transitioned.emit(self, "PlayerStateIdle")

func physics_update(delta: float) -> void:
	if not player.is_on_floor():
		player.velocity.y += player.get_fall_gravity() * delta
	
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		var max_speed = player.get_max_run_speed()
		var acceleration = player.get_walk_acceleration()
		player.velocity.x = move_toward(player.velocity.x, direction * max_speed, 
										acceleration)
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.get_walk_deceleration())
