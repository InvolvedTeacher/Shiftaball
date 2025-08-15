extends Node2D

@export var value: int = 1

@onready var area: Area2D = $Area2D

func _on_area_2d_body_entered(body):
	value = 1
	if (body is Player or body is Ball):
		GameController.collect_coin(value)
		self.queue_free()
