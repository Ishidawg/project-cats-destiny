class_name ItemContainer extends Resource

signal updated

@export var items: Array[Item]

func insert(item: Item):
	for i in range (items.size()):
		if !items[i]:
			items[i] = item
			break
	updated.emit()

func remove_item_at_index(index: int):
	items[index] = null

func insert_item_at_index(index: int, item: Item):
	var old_index: int = items.find(item)
	remove_item_at_index(old_index)
	
	items[index] = item
