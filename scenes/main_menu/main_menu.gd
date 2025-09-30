extends Control

func _on_play_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("uid://xicmeo17ejdw")  # main.tscn

func _on_quit_texture_button_pressed() -> void:
	get_tree().quit()
