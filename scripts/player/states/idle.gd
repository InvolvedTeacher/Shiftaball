extends State
class_name PlayerStateIdle

var player: CharacterBody2D

func enter():
	player = get_tree().get_first_node_in_group("Player")
	player.set_animation("idle")

func update(_delta: float):
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		transitioned.emit(self, "PlayerStateJump")
		return
	if Input.get_axis("move_left", "move_right"):
		transitioned.emit(self, "PlayerStateRun")
		return

func physics_update(delta: float):
	if not player.is_on_floor():
		player.velocity.y += player.get_fall_gravity() * delta
	
	if player.velocity.y > 0 and not player.is_on_floor():
		transitioned.emit(self, "PlayerStateFall")
		return
