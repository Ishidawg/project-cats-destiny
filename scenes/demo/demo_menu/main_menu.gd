extends Control
@onready var settings: Control = %Settings

func _ready() -> void:
	settings.visible = false

func _on_play_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("uid://xicmeo17ejdw")  # main.tscn

func _on_quit_texture_button_pressed() -> void:
	get_tree().quit()

func _on_option_button_texture_pressed() -> void:
	settings.visible = true
