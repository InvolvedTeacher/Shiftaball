extends Control

@onready var label = $Label

func _ready():
	EventController.connect("collect_coin", on_event_coin_collected)
	EventController.connect("coins_dropped", on_event_coin_dropped)
	
	
func on_event_coin_collected(value: int) -> void:
	label.text = str(value)


func on_event_coin_dropped(value: int) -> void:
	label.text = str(value)
