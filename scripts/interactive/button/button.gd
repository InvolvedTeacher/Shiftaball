extends Area2D

@onready var sprite: Sprite2D = $Sprite
@onready var hitbox: CollisionShape2D = $Hitbox
@export var bars: Bars
@onready var sfx_button: AudioStreamPlayer2D = $sfx_button

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		if not body.is_small():
			press_button()

func press_button() -> void:
	if hitbox.disabled:
		return
	sprite.texture = load("res://assets/interactive/button/button_pressed.png")
	hitbox.set_deferred("disabled", true)
	sfx_button.play()
	bars.unlock()
