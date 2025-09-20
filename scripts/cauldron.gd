class_name Cauldron extends Area2D

signal pressed

var item_array: Array[InventoryItem]

func insert(item: ItemStackGui):
	item_array.append(item.inventory_item)
	for i in item_array:
		print(i.name)
	print("-------------")

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		pressed.emit()
