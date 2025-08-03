extends CanvasLayer
class_name GameUI

var timer_scene: PackedScene = preload("uid://c6sql7cyp7str")

var score_pos: Vector2

func train_timer(passengers: Passengers) -> void: 
	var timer: PassengerProgress = timer_scene.instantiate()
	%Timers.add_child(timer)

	timer.passengers = passengers

func _ready() -> void:
	Global.score_changed.connect(interpolate_score)
	score_pos = %Score.position + %Score.pivot_offset

var shown_score: int:
	set(new_visual):
		shown_score = new_visual
		%Score.text = str(new_visual).pad_zeros(8)

var shown_speed: int:
	set(new_speed):
		shown_speed = new_speed
		%Speed.text = str(shown_speed).pad_zeros(3)

## Will visually update the score.
func interpolate_score() -> void:
	var tween: Tween = create_tween()
	tween.tween_property(self, "shown_score", Global.score, ScoreParticles.to_score_time).set_trans(Tween.TRANS_CUBIC).set_delay(ScoreParticles.explode_time)
	tween.play()
