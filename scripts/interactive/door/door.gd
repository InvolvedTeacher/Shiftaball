extends Area2D

@export var transition_type: String
@export var next_scene: String
@export var duration: float


func _ready() -> void:
	self.body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		finish_level()

func finish_level() -> void:
	SceneTransitionController.change_scene(next_scene, transition_type, duration)
