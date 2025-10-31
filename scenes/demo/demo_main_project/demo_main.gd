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
	YELLOW = 11, 
	
	LOVE = 0,
	CLAIRVOYANCE = 1,
	SERENITY = 2,
	LIFE = 3,
	HAPPINESS = 4,
	HARMONY = 5,
	PAIN = 6,
	CONFUSION = 7,
	MANIPULATION = 8,
	TORTURE = 9,
	REGRET = 10,
	DEATH = 11
	# Amor
	# Clarividência
	# Serenidade
	# Vida
	# Alegria
	# Harmonia
	# Dor 
	# Confusão
	# Manipulação 
	# Tortura
	# Arrependimento
	# Morte
}

var classes_dictionary = {
	[Id.MANIPULATION, Id.LIFE, Id.HARMONY]      : botanic_scene,
	[Id.LIFE, Id.SERENITY, Id.CLAIRVOYANCE]     : lunar_witch_scene,
	[Id.LOVE, Id.HAPPINESS, Id.LIFE]            : love_witch_scene,
	[Id.REGRET, Id.DEATH, Id.CONFUSION]         : arachnid_scene,
	[Id.DEATH, Id.PAIN, Id.TORTURE]             : hemomancer_scene,
	[Id.HAPPINESS, Id.MANIPULATION, Id.HARMONY] : bard_scene,
	[Id.MANIPULATION, Id.CONFUSION, Id.REGRET]  : illusionist_scene,
	[Id.HAPPINESS, Id.TORTURE, Id.LOVE]         : barbarian_scene,
	[Id.REGRET, Id.PAIN, Id.SERENITY]           : gunslinger_scene,
	[Id.CLAIRVOYANCE, Id.HARMONY, Id.SERENITY]  : archer_scene,

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
