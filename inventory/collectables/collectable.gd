class_name Collectable extends Area2D

@export var item_res: InventoryItem

func collect(inventory: Inventory):
	inventory.insert(item_res)
	queue_free()
