extends Node2D

var class_presentation_scene = preload("res://scenes/class_presentation/class_presentation.tscn")
var name_selection_scene = preload("res://scenes/name_selection/name_selection.tscn")

#var player = preload("res://scenes/player/player.tscn")

func _on_ready() -> void:
	ClassesDictionary.sort_dictionary()

func _on_cauldron_full(cauldron: Cauldron) -> void:
	# EXIBE A TELA MEIO PAH
	var name_selection: NameSelection = name_selection_scene.instantiate()
	add_child(name_selection)
	await name_selection.select() # Espera inserir o nome
	remove_child(name_selection)
	
	print(name_selection.input)
	
	var classe: Classe = ClassesDictionary.map[cauldron.items].instantiate()
	
	# Exibe a apresentação da classe
	var class_presentation: ClassPresentation = class_presentation_scene.instantiate()
	add_child(class_presentation)
	class_presentation.load(classe)
	await get_tree().create_timer(3).timeout
	class_presentation.free()
	
	#player.instantiate()
	#add_child(player)
	#player.classe = classe
