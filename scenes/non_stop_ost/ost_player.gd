extends AudioStreamPlayer

# This OST will be played into the post_cutscene and when it's choosing potions
const post_cutsene = preload("res://soundtrack/Contract Demons OST/04 sacroffice (potions).ogg")
const ending = preload("res://soundtrack/Starry Flowers OST/04 Astragalus (final).ogg")

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
	
	stream = music
	volume_db = volume
	bus = &"Music"
	
	play()
	
func _stop_music(music: AudioStream, volume = 0.0):
	if stream == music:
		stop()
	
	stop()

# Eu sei q esse codigo ta horrivel, TA! buceta <3
	
func play_music_post_cutsene():
	_play_music(post_cutsene)
	
func stop_music_post_cutsene():
	_stop_music(post_cutsene)
	
func play_music_post_ending():
	_play_music(ending)
	
func stop_music_post_ending():
	_stop_music(ending)
