extends CanvasLayer
class_name GameUI

var timer_scene: PackedScene = preload("uid://c6sql7cyp7str")

func train_timer(passengers: Passengers) -> void: 
	var timer: PassengerProgress = timer_scene.instantiate()
	%Timers.add_child(timer)

	timer.passengers = passengers

func _ready() -> void:
	Global.score_changed.connect(interpolate_score)

var shown_score: int:
	set(new_visual):
		shown_score = new_visual
		%Score.text = str(new_visual).pad_zeros(8)

## Will visually update the score.
func interpolate_score() -> void:
	var tween: Tween = create_tween()
	tween.tween_property(self, "shown_score", Global.score, 0.5).set_trans(Tween.TRANS_CUBIC)
	tween.play()
