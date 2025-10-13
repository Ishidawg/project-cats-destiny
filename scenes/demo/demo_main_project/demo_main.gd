extends Node2D

var archer_scene = load("res://scenes/classes/archer.tscn")
var lunar_witch_scene = load("res://scenes/classes/lunar_witch.tscn")
var botanic_scene = load("res://scenes/classes/botanic.tscn")
var love_witch_scene = load("res://scenes/classes/love_witch.tscn")
var gunslinger_scene = load("res://scenes/classes/gunslinger.tscn")
var barbarian_scene = load("res://scenes/classes/barbarian.tscn")
var arachnid_scene = load("res://scenes/classes/arachnid.tscn")
var illusionist_scene = load("res://scenes/classes/illusionist.tscn")
var hemomancer_scene = load("res://scenes/classes/hemomancer.tscn")
var bard_scene = load("res://scenes/classes/bard.tscn")

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

var classes_dictionary = {
	[Id.PINK, Id.PURPLE, Id.LIGHT_RED] : love_witch_scene,
	[Id.LIME, Id.DARK_BLUE, Id.YELLOW] : barbarian_scene,
	[Id.RED, Id.ORANGE, Id.DARK_BLUE]  : gunslinger_scene,
	[Id.GREY, Id.LIGHT_RED,Id.LILAC]   : lunar_witch_scene,
	[Id.RED, Id.LIGHT_RED, Id.GREY]    : hemomancer_scene,
	[Id.LIME, Id.ORANGE, Id.YELLOW]    : bard_scene,
	[Id.BLUE, Id.GREEN, Id.YELLOW]     : archer_scene,
	[Id.GREEN, Id.PINK, Id.LILAC]      : botanic_scene,
	[Id.PINK, Id.PURPLE, Id.BLUE]      : illusionist_scene,
	[Id.RED, Id.GREY, Id.PURPLE]       : arachnid_scene,
}

var class_presentation_scene = preload("res://scenes/classes/class_presentation.tscn")
var name_selection_scene = preload("res://scenes/name_selection/name_selection.tscn")

#var player = preload("res://scenes/player/player.tscn")

func _on_cauldron_full(cauldron: Cauldron) -> void:
	sort_dict()
	cauldron.items.sort()
	
	var classe: Classe = classes_dictionary[cauldron.items].instantiate()
	
	var class_presentation: ClassPresentation = class_presentation_scene.instantiate()
	add_child(class_presentation)
	class_presentation.load(classe)
	await get_tree().create_timer(3).timeout
	# EXIBE A TELA MEIO PAH
	
	class_presentation.free()
	
	var name_selection: NameSelection = name_selection_scene.instantiate()
	add_child(name_selection)
	await name_selection.select() # Espera inserir o nome
	remove_child(name_selection)
	
	print(name_selection.input)
	
	#player.instantiate()
	#add_child(player)
	#player.classe = classe


func sort_dict():
	for key in classes_dictionary.keys():
		var description = classes_dictionary[key]
		key.sort()
		classes_dictionary[key] = description
