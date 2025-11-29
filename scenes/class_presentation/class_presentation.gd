class_name ClassPresentation extends Control

@onready var class_image_sprite: Sprite2D = $ClassImageSprite
@onready var class_description_label: Label = $CanvasLayer/ClassDescriptionLabel
@onready var player_name_label: Label = $CanvasLayer/Card/PlayerNameLabel
@onready var texture: AnimatedSprite2D = $CanvasLayer/Card/AnimatedSprite2D
@onready var gun: Sprite2D = $CanvasLayer/Card/Sprite2D

func class_load() -> void:
	var classe = PlayerData.player_class
	add_child(classe)
	class_description_label.text = "Classe: "+classe.description
	player_name_label.text = PlayerData.player_name
	texture.sprite_frames = classe.animated_texture.sprite_frames
	texture.play("default")
	gun.texture = classe.gun.texture
