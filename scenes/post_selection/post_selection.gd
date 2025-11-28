extends Node2D

enum Reactions {
	UNDEFINED,
	ANGRY,
	NEUTRAL,
	HAPPY
}

var class_presentation_scene = preload("res://scenes/class_presentation/class_presentation.tscn")
var name_selection_scene = preload("res://scenes/name_selection/name_selection.tscn")
var reaction: Reactions

@onready var gato: Sprite2D = $DefaultLayer/Gato
@onready var seller: Sprite2D = $DefaultLayer/Seller

@export var dialog_key := ""
@export var title_key := ""
@export_file("*") var character_image
@onready var dialog_player: DialogPlayer = $DefaultLayer/DialogPlayer

func _on_ready() -> void:
	reaction = Reactions.UNDEFINED
	set_reaction()
	set_dialogue()
	set_assets()
	dialog_player.play_dialogue.emit()


func set_dialogue():
	if reaction == Reactions.ANGRY:
		dialog_player.dialog_key = "resposta_brava"
	elif reaction == Reactions.HAPPY:
		dialog_player.dialog_key = "resposta_feliz"
	elif reaction == Reactions.NEUTRAL:
		dialog_player.dialog_key = "resposta_neutra"
	else:
		dialog_player.dialog_key = "blank"

func set_assets():
	if reaction == Reactions.ANGRY:
		seller.texture = load("res://assets/expression/vendedorabrava.png")
		gato.texture = load("res://assets/expression/gatinhotriste1.png")
	elif reaction == Reactions.HAPPY:
		seller.texture = load("res://assets/expression/vendedorafeliz.png")
		gato.texture = load("res://assets/expression/gatinhofeliz.png")
	elif reaction == Reactions.NEUTRAL:
		seller.texture = load("res://assets/expression/vendedoraneutra1.png")
		gato.texture = load("res://assets/expression/gatinhoneutro.png")


func _on_dialog_player_finished() -> void:
	# EXIBE A TELA MEIO PAH
	var name_selection: NameSelection = name_selection_scene.instantiate()
	add_child(name_selection)
	await name_selection.select() # Espera inserir o nome
	remove_child(name_selection)
	
	print(name_selection.input)
	
	# Exibe a apresentação da classe
	var class_presentation: ClassPresentation = class_presentation_scene.instantiate()
	add_child(class_presentation)
	class_presentation.class_load(PlayerData.player_class)

func set_reaction():
	if !PlayerData.player_class:
		return
	
	if PlayerData.player_class.description in ['Aracnídeo', 'Hemomante', 'Bárbaro']:
		reaction = Reactions.ANGRY
	elif PlayerData.player_class.description in ['Bruxinha Do Amor', 'Bruxinha Lunar', 'Botanista']:
		reaction = Reactions.HAPPY
	elif PlayerData.player_class.description in ['Ilusionista', 'Arqueiro', 'Bardo', 'Atirador']:
		reaction = Reactions.NEUTRAL
