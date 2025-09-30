class_name Slot extends Button

@onready var backgroud_sprite: Sprite2D = $Background
@onready var container: CenterContainer = $CenterContainer
@onready var item_container = preload("uid://bq7w3phpr0jbk")

var item_stack_gui: ItemStackGui
var index: int

func insert(isg: ItemStackGui):
	item_stack_gui = isg
	backgroud_sprite.frame = 1
	container.add_child(item_stack_gui)
	
	if !item_stack_gui.item || item_container.items[index] == item_stack_gui.item:
		return
	
	item_container.insert_item_at_index(index, item_stack_gui.item)

func take_item() -> ItemStackGui:
	var item = item_stack_gui
	
	container.remove_child(item_stack_gui)
	item_stack_gui = null
	backgroud_sprite.frame = 0
	
	return item

func is_empty():
	return !item_stack_gui
