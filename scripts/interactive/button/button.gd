extends Area2D

@onready var sprite: Sprite2D = $Sprite
@onready var hitbox: CollisionShape2D = $Hitbox
@export var bars: Bars

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		if not body.is_small():
			press_button()

func press_button() -> void:
	sprite.texture = load("res://assets/interactive/button/button_pressed.png")
	hitbox.disabled
	bars.unlock()
