extends CanvasLayer
class_name GameOverMenu

func game_over_animation() -> void:
	%Score.text = "Score: %d" % Global.score
	get_tree().paused = true
	Global.state_manager.change_state(State.STATE_TYPE.INACTIVE)
	%AnimationPlayer.play("gameover")

func _on_exit_pressed() -> void:
	Transition.change_scene("uid://bukq1ieysq0am")

func _on_replay_pressed() -> void:
	Transition.change_scene("uid://co3jvbpwp7vnh")
