extends CanvasLayer

@onready var window_mode_options: OptionButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/WindowModeOptions


var window_modes : Dictionary = {"Fullscreen" : DisplayServer.WINDOW_MODE_FULLSCREEN,
								  "Windowed" : DisplayServer.WINDOW_MODE_WINDOWED,
								  "Window Maximized" : DisplayServer.WINDOW_MODE_MAXIMIZED}


func _ready():
	for window_mode in window_modes:
		window_mode_options.add_item(window_mode)
	
	initialise_controls()


func initialise_controls():
	SettingsManager.load_settings()
	var settings_data : SettingsDataResource = SettingsManager.get_settings()
	window_mode_options.selected = settings_data.window_mode_index


func _on_main_menu_button_pressed() -> void:
	SettingsManager.save_settings()
	queue_free()


func _on_window_mode_options_item_selected(index: int) -> void:
	var window_mode = window_modes.get(window_mode_options.get_item_text(index)) as int
	SettingsManager.set_window_mode(window_mode, index)
