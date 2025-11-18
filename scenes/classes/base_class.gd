class_name Classe extends Node

@export var description: String = ""
@onready var animated_texture: AnimatedSprite2D = $ClassSprites
@onready var gun: Sprite2D = $Gun

func _on_ready() -> void:
	animated_texture.visible = false
	gun.visible = false
