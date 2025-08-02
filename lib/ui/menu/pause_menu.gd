extends CanvasLayer
class_name PauseMenu

var paused: bool:
	set(new_paused):
		paused = new_paused
		if new_paused:
			get_tree().paused = true
			%AnimationPlayer.play("paused")
		else:
			get_tree().paused = false
			%AnimationPlayer.play_backwards("paused")

func _on_play_pressed() -> void:
	paused = false
