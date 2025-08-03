extends TextureRect
class_name ScoreParticle

var pitch: float:
	set(new_pitch):
		pitch = new_pitch
		%AudioStreamPlayer.pitch_scale = new_pitch

func play_sound() -> void:
	%AudioStreamPlayer.play()
	await %AudioStreamPlayer.finished
	queue_free()
