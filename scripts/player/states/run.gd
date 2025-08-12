extends State
class_name PlayerStateRun

var player: CharacterBody2D

func enter():
	player = get_tree().get_first_node_in_group("Player")
	player.set_animation("run")

func update(_delta):
	if Input.is_action_just_pressed("throw"):
		transitioned.emit(self, "PlayerStateThrow")
		return

func physics_update(delta: float):
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
	
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		transitioned.emit(self, "PlayerStateJump")
	if abs(player.velocity.x) > player.get_max_run_speed():
		transitioned.emit(self, "PlayerStateRun")
	if player.velocity.y < 0:
		transitioned.emit(self, "PlayerStateJump")
	if player.velocity.y > 0:
		transitioned.emit(self, "PlayerStateFall")
	if player.velocity.x == 0:
		transitioned.emit(self, "PlayerStateIdle")
