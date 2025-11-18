extends Node

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	await animation_player.animation_finished
	SceneTransition.change_scene("res://scenes/potion_selection/potion_selection.tscn")
