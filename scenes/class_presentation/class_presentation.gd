class_name ClassPresentation extends Control

@onready var class_image_sprite: Sprite2D = $ClassImageSprite
@onready var class_description_label: Label = $CanvasLayer/ClassDescriptionLabel
@onready var texture: AnimatedSprite2D = $CanvasLayer/Background/AnimatedSprite2D
@onready var gun: Sprite2D = $CanvasLayer/Background/Sprite2D

func class_load(classe: Classe) -> void:
	add_child(classe)
	class_description_label.text = classe.description
	texture.sprite_frames = classe.animated_texture.sprite_frames
	texture.play("default")
	gun.texture = classe.gun.texture
