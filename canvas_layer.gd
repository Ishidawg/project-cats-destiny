extends CanvasLayer

@onready var inventory = $InventoryGui

func _ready() -> void:
	inventory.close()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_inventory"):
		if inventory.is_open:
			inventory.close()
		else:
			inventory.open()
