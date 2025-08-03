extends CanvasLayer
class_name PauseMenu

func _ready() -> void:
	visible = false

var paused: bool:
	set(new_paused):
		paused = new_paused
		if new_paused:
			visible = true
			get_tree().paused = true
			%AnimationPlayer.play("paused")
		else:
			get_tree().paused = false
			%AnimationPlayer.play_backwards("paused")
			await %AnimationPlayer.animation_finished
			visible = false

func _on_play_pressed() -> void:
	paused = false
	Global.state_manager.change_state(State.STATE_TYPE.ACTIVE)

func _on_exit_pressed() -> void:
	Transition.change_scene("uid://bukq1ieysq0am")
