extends CanvasLayer

@onready var transition_effect: ColorRect = $transition_effect
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func change_scene(target_scene) -> void:
	animation_player.play("transition_out")
	await animation_player.animation_finished
	
	get_tree().change_scene_to_file(target_scene)
	animation_player.play("transition_in")
	#animation_player.play_backwards("transition_out")
