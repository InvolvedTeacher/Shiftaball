extends CanvasLayer


func _on_play_button_pressed() -> void:
	GameController.start_game()
	queue_free()


func _on_quit_button_pressed() -> void:
	GameController.exit_game()
