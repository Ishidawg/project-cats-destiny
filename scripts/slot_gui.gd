extends Panel

@onready var backgroud_sprite: Sprite2D = $Background
@onready var item_sprite: Sprite2D = $CenterContainer/Panel/Item

func update(item: InventoryItem):
	if !item:
		backgroud_sprite.frame = 0
		item_sprite.visible = false
	else:
		backgroud_sprite.frame = 1
		item_sprite.visible = true
		item_sprite.texture = item.texture
