class_name ItemStackGui extends Panel

@onready var item_sprite: Sprite2D = $Item

var item: Item

func update():
	if !item: return
	
	item_sprite.visible = true
	item_sprite.texture = item.texture
