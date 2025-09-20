class_name Collectable extends Area2D

@export var item_res: Item

func collect(item_container: ItemContainer):
	item_container.insert(item_res)
	queue_free()
