extends CanvasLayer




func _on_resume_button_pressed() -> void:
	GameController.continue_game()
	queue_free()


func _on_main_menu_button_pressed() -> void:
	GameController.main_menu()
	queue_free()


func _on_quit_button_pressed() -> void:
	GameController.exit_game()


func _on_restart_button_pressed() -> void:
	GameController.restart_level()


func _process(delta):
	if Input.is_action_just_pressed("esc") and get_tree().paused:
		GameController.continue_game()
		queue_free()
