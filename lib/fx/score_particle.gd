extends TextureRect
class_name ScoreParticle

func play_sound() -> void:
	%AudioStreamPlayer.play()
	await %AudioStreamPlayer.finished
	queue_free()
