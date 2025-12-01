extends Node2D

#var player = preload("res://scenes/player/player.tscn")

func _on_ready() -> void:
	ClassesDictionary.sort_dictionary()

func _on_cauldron_full(cauldron: Cauldron) -> void:
	PlayerData.player_class = ClassesDictionary.map[cauldron.items].instantiate()
	
	SceneTransition.change_scene("res://scenes/post_selection/post_selection.tscn")



	#await get_tree().create_timer(3).timeout
	#class_presentation.free()
	
	#player.instantiate()
	#add_child(player)
	#player.classe = classe
