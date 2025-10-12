extends Control

@onready var line_edit: LineEdit = $VBoxContainer/LineEdit
@export var name_selection : String = line_edit.value()
