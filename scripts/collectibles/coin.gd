extends Node2D

@export var value: int = 1

@onready var area: Area2D = $Area2D
@onready var sfx_coin: AudioStreamPlayer2D = $sfx_coin
@onready var timer: Timer = $Timer
var collected : bool = false


func _ready():
	timer.timeout.connect(_on_timeout)

func _on_area_2d_body_entered(body):
	if collected:
		return
	# or body is Ball
	if (body is Player or body is Ball):
		
		print("cáspitas, me capturaste! soy una moneda, estoy en ", self.global_position)
		sfx_coin.play()
		GameController.collect_coin(value)
		timer.start()
		self.visible = false
		collected = true

func _on_timeout() -> void:
	area.set_deferred("monitoring", false)
