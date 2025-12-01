extends CanvasLayer

@onready var canvas_layer: CanvasLayer = $"."

signal toggle_crt

# To mantain the same configure across the scenes
var global_crt_state : bool = true

func _ready() -> void:
	canvas_layer.visible = global_crt_state
	print(canvas_layer.visible)

func set_visibility():
	self.canvas_layer.visible = global_crt_state
	canvas_layer.visible = global_crt_state
	print("current: ", canvas_layer.visible)

func _on_toggle_crt() -> void:
	canvas_layer.visible = !canvas_layer.visible
	global_crt_state = canvas_layer.visible
	print("canva: ", canvas_layer.visible)
	print("global: ", global_crt_state)
