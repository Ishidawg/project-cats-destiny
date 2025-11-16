extends Control

@onready var panel: Panel = %Panel

func _on_close_button_pressed() -> void:
	panel.visible = false

func _on_crt_checkbox_toggled(toggled_on: bool) -> void:
	print("on")

func _on_fullscreen_checkbox_toggled(toggled_on: bool) -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN) if toggled_on else DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
