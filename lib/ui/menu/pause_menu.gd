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
	Global.state_manager.change_state(State.STATE_TYPE.ACTIVE)

func _on_exit_pressed() -> void:
	Transition.change_scene("uid://bukq1ieysq0am")
