extends CollisionObject2D
class_name Fan

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collider: CollisionShape2D = $Collider

@export var float_speed : float
@export var ball : Ball

@onready var particles1: GPUParticles2D = $GPUParticles2D
@onready var particles2: GPUParticles2D = $GPUParticles2D2
@onready var particles3: GPUParticles2D = $GPUParticles2D3

var fan : CollisionObject2D

var is_active : bool
var boost : bool

func activate() -> void:
	is_active = true
	animated_sprite_2d.play("spin")
	particles1.emitting = true
	particles2.emitting = true
	particles3.emitting = true

func deactivate() -> void:
	is_active = false
	animated_sprite_2d.play("stopped")
	particles1.emitting = false
	particles2.emitting = false
	particles3.emitting = false

func _process(_delta):
	var rotation_rad = deg_to_rad(rotation)
	if boost and is_active and ball.is_small():
		ball.velocity.y -= float_speed * _delta * cos(rotation_rad)
		ball.velocity.x += float_speed * _delta * sin(rotation_rad)


func _on_air_body_entered(body: Node2D) -> void:
	if body is Ball:
		boost = true


func _on_air_body_exited(body: Node2D) -> void:
	if body is Ball:
		boost = false
