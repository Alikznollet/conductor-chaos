extends PathFollow2D
class_name Train

### ! Train track and driving logic.

var passed_splitter: Splitter:
	set(new_splitter):
		if passed_splitter: passed_splitter.enabled = true
		if new_splitter: new_splitter.enabled = false
		passed_splitter = new_splitter

## Number between 0 and 1 indicating the position 
var speed: float:
	set(new_speed):
		speed = clamp(new_speed, 0, 1)

@export var speed_curve: Curve

var previous_progress: float = 0

func _process(delta: float) -> void:
	progress += speed_curve.sample(speed) * max_speed * delta

	if previous_progress - progress_ratio > 0.5:
		Global.train.passed_splitter = null

	previous_progress = progress_ratio

	## Decrease the patience of the boarded passengers.
	for passenger in passengers_boarded:
		passenger.patience -= delta

@export var max_speed: float = 200

## How much speed increases per second
@export var speed_increase: float = 0.3
@export var speed_decrease: float = 0.3

func accelerate(delta: float) -> void:
	speed += speed_increase * delta

func decelerate(delta:float) -> void:
	speed -= speed_decrease * delta

func _on_train_box_area_entered(area: Area2D) -> void:
	# Disable the splitter we just passed.
	if area is Splitter:
		passed_splitter = area

### ! PASSENGER LOGIC

var passengers_boarded: Array[Passengers] = []

func board_passengers(passengers: Passengers) -> void:
	passengers.patience = passengers.max_patience
	passengers_boarded.append(passengers)
	Global.game_ui.train_timer(passengers)

func exit_passengers_at(station_name: String) -> void:
	var passengers_exited: Array[Passengers] = []
	for passengers in passengers_boarded:
		if passengers.destination.name == station_name:
			passengers_exited.append(passengers)

	for passengers in passengers_exited:
		passengers_boarded.erase(passengers)
		passengers.reached_destination.emit()
