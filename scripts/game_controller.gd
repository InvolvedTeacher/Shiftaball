extends Node

var coins_collected: int = 0

func collect_coin(value: int):
	coins_collected += value
	EventController.emit_signal("collect_coin", coins_collected)


func player_death(value: bool) -> void:
	var updateUI: bool = false
	if coins_collected != 0:
		updateUI = true
	
	if value:
		coins_collected = 0
		
	if updateUI:
		EventController.emit_signal("coins_dropped", coins_collected)
