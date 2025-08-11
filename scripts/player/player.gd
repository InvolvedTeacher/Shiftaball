extends CharacterBody2D

@export var jump_gravity: float
@export var fall_gravity: float
@export var max_run_speed: float
@export var run_acceleration: float
@export var run_deceleration: float
@export var airborne_deceleration: float
@export var jump_vertical_speed: float

@onready var sprite: AnimatedSprite2D = $Sprite

func _ready() -> void:
	sprite.play()

func _process(_delta):
	var facing_left =  velocity.x < 0
	sprite.flip_h = facing_left

func _physics_process(_delta):
	move_and_slide()

func set_animation(new_animation: String) -> void:
	sprite.animation = new_animation

func get_jump_gravity() -> float:
	return jump_gravity

func get_fall_gravity() -> float:
	return fall_gravity

func get_max_run_speed() -> float:
	return max_run_speed

func get_walk_acceleration() -> float:
	return run_acceleration

func get_walk_deceleration() -> float:
	return run_deceleration

func get_airborne_deceleration() -> float:
	return airborne_deceleration

func get_jump_vertical_speed() -> float:
	return jump_vertical_speed
