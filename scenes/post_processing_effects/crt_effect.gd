extends Control

@onready var canvas_layer: CanvasLayer = $CanvasLayer

signal toggle_crt

func _ready() -> void:
	canvas_layer.visible = false

func _on_toggle_crt() -> void:
	canvas_layer.visible = !canvas_layer.visible
