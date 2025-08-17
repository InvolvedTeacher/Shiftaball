extends Area2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var hitbox: CollisionShape2D = $Hitbox
@export var fan: Fan

var is_active : bool = false
var ball_is_touching : bool = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		if not body.is_small():
			if !is_active and !ball_is_touching:
				activate_lever()
				is_active = true
				ball_is_touching = true
			
			if is_active  and !ball_is_touching:
				deactivate_lever()
				is_active = false
				ball_is_touching = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Ball":
		ball_is_touching = false


func activate_lever() -> void:
	sprite.texture = load("res://assets/interactive/lever/lever_active.png")
	fan.activate()

func deactivate_lever() -> void:
	sprite.texture = load("res://assets/interactive/lever/lever_inactive.png")
	fan.deactivate()
