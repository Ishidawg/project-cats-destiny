class_name ClassPresentation extends Control

@onready var class_image_sprite: Sprite2D = $ClassImageSprite
@onready var class_description_label: Label = $ClassDescriptionLabel

func load(classe: Classe) -> void:
	class_image_sprite.texture = classe.texture
	class_description_label.text = classe.description
