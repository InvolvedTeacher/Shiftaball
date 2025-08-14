extends CanvasLayer

const main_scene: PackedScene = preload('res://scenes/levels/level1.tscn')

@onready var play = $Menu/MarginContainer/InnerBackground/InnerContainer/PlayButton/Button

@onready var quit = $Menu/MarginContainer/InnerBackground/InnerContainer/QuitButton/Button

func _ready():
	load_main_menu()
	

func load_main_menu():
	play.connect('pressed', _on_play_pressed)
	quit.connect('pressed', _on_quit_pressed)
	
	
func _on_play_pressed() -> void:
	var game = self.get_parent()
	self.queue_free()
	var world_scene = main_scene.instantiate()
	game.add_child(world_scene)
	

func _on_quit_pressed() -> void:
	get_tree().quit()
