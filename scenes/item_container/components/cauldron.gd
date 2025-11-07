class_name Cauldron extends Area2D

signal pressed
signal full

var is_full: bool = false
@export var limit = 3
var items: Array[int]

func insert(item_stack: ItemStackGui):
	items.append(item_stack.item.id)
	
	if items.size() >= limit:
		check_potions()

func check_potions():
	items.sort()
	if (items.size() == limit) and (items in ClassesDictionary.map):
		set_full()
		return
	else:
		var combinacoes = gerar_combinacoes_3_digitos()
		for aux_items in combinacoes:
			if (aux_items in ClassesDictionary.map):
				items = aux_items
				set_full()
				return

func gerar_combinacoes_3_digitos() -> Array:
	# Retorna um array de arrays[Int] com todas as combinações de 3 numeros existentes no array original (Items)
	var combinacoes: Array = []
	var n = items.size() 
	for i in range(n):
		for j in range(i + 1, n):
			for k in range(j + 1, n):
				var array: Array[int] = [items[i], items[j], items[k]]
				combinacoes.push_back(array)
	return combinacoes

func set_full():
	is_full = true
	full.emit()

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		pressed.emit()
