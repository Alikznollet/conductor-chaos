extends State
class_name InactiveState

func _ready() -> void:
	type = STATE_TYPE.INACTIVE

func enter() -> void:
	var tween: Tween = create_tween()
	tween.tween_property(Music, "pitch_scale", 0.6, 0.4)
	tween.play()

func update(_delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		Global.pause_menu.paused = false
		Global.state_manager.change_state(STATE_TYPE.ACTIVE)
