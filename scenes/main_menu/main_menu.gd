extends Control

@onready var settings_menu: Panel = %settings_menu

@onready var play: Button = %play
@onready var options: Button = %options
@onready var quit: Button = %quit
@onready var close_btn: Button = %close_btn

@onready var crt_effect: CanvasLayer = %CrtEffect

func _ready() -> void:
	settings_menu.visible = false

func _on_play_pressed() -> void:
	SceneTransition.change_scene("res://scenes/cutscene/Cutscene.tscn")

func _on_options_pressed() -> void:
	settings_menu.visible = true

func _on_close_btn_pressed() -> void:
	settings_menu.visible = false

func _on_quit_pressed() -> void:
	get_tree().free()

func _on_fullscreen_cb_toggled(toggled_on: bool) -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN) if toggled_on else DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_crt_cb_toggled(toggled_on: bool) -> void:
	CrtEffect.toggle_crt.emit()
