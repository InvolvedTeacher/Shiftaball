extends State
class_name PlayerStateDeath

var player: CharacterBody2D


func enter():
	player = get_tree().get_first_node_in_group("Player")
	player.set_animation("death")
	player.velocity.y = 0.0
	


func physics_update(delta: float):
	var speed : float = player.velocity.y
	player.velocity.y += player.get_death_fly_speed() * delta
