extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		finish_level()

func finish_level() -> void:
	print("Yay")
	pass
