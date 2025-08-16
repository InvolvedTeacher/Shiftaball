extends CanvasLayer

var settings_menu_screen = preload("res://scenes/ui/settings_menu_screen.tscn")

func _on_play_button_pressed() -> void:
	GameController.start_game()
	queue_free()


func _on_quit_button_pressed() -> void:
	GameController.exit_game()


func _on_settings_button_pressed() -> void:
	var settings_menu_screen_instance = settings_menu_screen.instantiate()
	get_tree().get_root().add_child(settings_menu_screen_instance)
