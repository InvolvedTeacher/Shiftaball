extends State
class_name PlayerStateJump

var player: CharacterBody2D

func enter():
	player = get_tree().get_first_node_in_group("Player")
	player.set_animation("jump")

func update(_delta):
	if player.velocity.y > 0:
		transitioned.emit(self, "PlayerStateFall")
	if player.velocity.y == 0 and player.is_on_floor():
		if player.velocity.x == 0:
			transitioned.emit(self, "PlayerStateIdle")
		else:
			transitioned.emit(self, "PlayerStateRun")
