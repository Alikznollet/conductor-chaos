extends CanvasLayer
class_name GameUI

var timer_scene: PackedScene = preload("uid://c6sql7cyp7str")

func train_timer(passengers: Passengers) -> void: 
	var timer: PassengerProgress = timer_scene.instantiate()
	timer.passengers = passengers

	%Timers.add_child(timer)
