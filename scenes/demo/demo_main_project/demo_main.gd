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

var classes_dictionary = {
	# Os ids chave devem estar em ordem crescente na declaração do dicionário
	[Id.BLUE,Id.GREEN,Id.PURPLE]: load("res://scenes/classes/archer.tscn"),
	[Id.GREY,Id.LILAC,Id.RED]   : load("res://scenes/classes/lunar_witch.tscn")
}

func _on_cauldron_full(cauldron: Cauldron) -> void:	
	cauldron.items.sort()
	
	var classe: Classe = classes_dictionary[cauldron.items].instantiate()
	print(classe.description)
