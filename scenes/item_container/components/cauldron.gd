class_name Cauldron extends Area2D

signal pressed
signal full

var is_full: bool = false
@export var limit = 3
var items: Array[int]

func insert(item_stack: ItemStackGui):
	items.append(item_stack.item.id)
	
	if items.size() >= limit:
		is_full = true
		full.emit()

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		pressed.emit()
