extends Area2D

@export var dialog_key := ""
@export var title_key := ""
@export_file("*") var character_image

var area_active := false

func _input(event):
	if area_active and event.is_action_pressed("accept"):
		SignalDisplayDialogue.emit_signal("display_dialog", title_key, dialog_key, character_image)

func _on_area_entered(_area: Area2D) -> void:
	area_active = true

func _on_area_exited(_area: Area2D) -> void:
	area_active = false
