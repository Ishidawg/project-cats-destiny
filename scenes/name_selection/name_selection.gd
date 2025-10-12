class_name NameSelection extends Control

@onready var line_edit: LineEdit = $VBoxContainer/LineEdit
var input: String

signal PA

func select():
	while true:
		await PA
		#validações do nome
		input = line_edit.text
		if input != "":
			break
	self.queue_free()
	return

func _on_btn_ok_pressed() -> void:
	PA.emit()
