extends State
class_name PlayerStateRun

var player: CharacterBody2D

func enter():
	player = get_tree().get_first_node_in_group("Player")
	player.set_animation("run")

func update(_delta):
	if player.velocity.y > 0:
		transitioned.emit(self, "PlayerStateFall")
	if player.velocity.y < 0:
		transitioned.emit(self, "PlayerStateJump")
	if player.velocity.x == 0:
		transitioned.emit(self, "PlayerStateIdle")
