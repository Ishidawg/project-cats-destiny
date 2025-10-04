extends Node2D

func _on_cauldron_full(cauldron: Cauldron) -> void:
	for item in cauldron.items:
		print(item.name)
