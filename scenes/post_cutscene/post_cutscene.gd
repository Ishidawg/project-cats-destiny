extends Node2D

@export var dialog_key := ""
@export var title_key := ""
@export_file("*") var character_image

func _input(event):
	if event.is_action_pressed("accept"):
		SignalDisplayDialogue.emit_signal("display_dialog", title_key, dialog_key, character_image)


func _on_dialog_player_finished() -> void:
	SceneTransition.change_scene("res://scenes/potion_selection/potion_selection.tscn")
