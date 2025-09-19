class_name ItemStackGui extends Panel

@onready var item_sprite: Sprite2D = $Item

var inventory_item: InventoryItem

func update():
	if !inventory_item: return
	
	item_sprite.visible = true
	item_sprite.texture = inventory_item.texture
