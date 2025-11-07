extends Node

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

var map = {
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

func sort_dictionary():
	for key in map.keys():
		var description = map[key]
		key.sort()
		map[key] = description
