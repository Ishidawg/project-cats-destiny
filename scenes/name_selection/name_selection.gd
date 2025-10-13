class_name NameSelection extends Control

@onready var line_edit: LineEdit = $VBoxContainer/VBoxContainer/LineEdit
var input: String

signal PA

func select():
	while true:
		await PA
		#validações do nome
		input = line_edit.text
		if input != "":
			break
	return

func _on_confirm_button_pressed() -> void:
	PA.emit()
