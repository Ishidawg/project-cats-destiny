class_name Inventory extends Resource

signal updated

@export var items: Array[InventoryItem]

func insert(item: InventoryItem):
	for i in range (items.size()):
		if !items[i]:
			items[i] = item
			break
	updated.emit()

func remove_item_at_index(index: int):
	items[index] = null

func insert_item_at_index(index: int, inventory_item: InventoryItem):
	var old_index: int = items.find(inventory_item)
	remove_item_at_index(old_index)
	
	items[index] = inventory_item
