class_name InventoryGui extends Control

signal opened
signal closed

var is_open: bool = false

@onready var inventory: Inventory = preload("res://inventory/player_inventory.tres")
@onready var item_stack_gui_class = preload("res://gui/item_stack_gui.tscn")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()
@onready var cauldron: Cauldron = $Cauldron

var item_in_hand: ItemStackGui

func _ready():
	connect_slots()
	inventory.updated.connect(update)
	update()

func connect_slots():
	for i in range (slots.size()):
		var slot = slots[i]
		slot.index = i
		
		var callable = Callable(on_slot_clicked).bind(slot)
		slot.pressed.connect(callable)

func update():
	for i in range(min(inventory.items.size(), slots.size())):
		var inventory_item: InventoryItem = inventory.items[i]
		
		if !inventory_item: continue
		
		var item_stack_gui: ItemStackGui = slots[i].item_stack_gui
		if !item_stack_gui:
			item_stack_gui = item_stack_gui_class.instantiate()
			slots[i].insert(item_stack_gui)
		
		item_stack_gui.inventory_item = inventory_item
		item_stack_gui.update()

func open():
	visible = true
	is_open = true 
	opened.emit()

func close():
	visible = false
	is_open = false
	closed.emit()

func on_slot_clicked(slot: Slot):
	if slot.is_empty() && item_in_hand:
		insert_item_in_slot(slot)
		return
	
	if !item_in_hand:
		take_item_from_slot(slot)

func take_item_from_slot(slot: Slot):
	item_in_hand = slot.take_item()
	add_child(item_in_hand)
	update_item_in_hand()

func insert_item_in_slot(slot: Slot):
	var item = item_in_hand
	remove_child(item_in_hand)
	item_in_hand = null
	slot.insert(item)

func update_item_in_hand():
	if !item_in_hand: return
	item_in_hand.global_position = get_global_mouse_position() - (item_in_hand.size / 2)

func _input(_event):
	update_item_in_hand()


func _on_cauldron_pressed() -> void:
	if item_in_hand:
		var item = item_in_hand
		remove_child(item_in_hand)
		item_in_hand = null
		cauldron.insert(item)
