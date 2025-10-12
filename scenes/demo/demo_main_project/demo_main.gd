extends Node2D

enum Id {
	BLUE = 0,
	DARK_BLUE = 1,
	GREEN = 2,
	GREY = 3,
	LIGHT_RED = 4,
	LILAC = 5,
	LIME = 6,
	ORANGE = 7,
	PINK = 8,
	PURPLE = 9,
	RED = 10,
	YELLOW = 11
}

var archer_scene = load("res://scenes/classes/archer.tscn")
var lunar_witch_scene = load("res://scenes/classes/lunar_witch.tscn")
var class_presentation_scene = preload("res://scenes/classes/class_presentation.tscn")

var classes_dictionary = {
	# Os ids chave devem estar em QUALQUER ordem
	[Id.BLUE, Id.GREEN, Id.YELLOW] : archer_scene,
	[Id.GREY,Id.LIGHT_RED,Id.LILAC]: lunar_witch_scene 
}

func _on_cauldron_full(cauldron: Cauldron) -> void:
	sort_dict()
	cauldron.items.sort()
	
	var classe: Classe = classes_dictionary[cauldron.items].instantiate()
	
	var class_presentation: ClassPresentation = class_presentation_scene.instantiate()
	add_child(class_presentation)
	class_presentation.load(classe)

func sort_dict():
	for key in classes_dictionary.keys():
		var description = classes_dictionary[key]
		key.sort()
		classes_dictionary[key] = description
