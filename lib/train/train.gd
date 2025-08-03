extends PathFollow2D
class_name Train

### ! Train track and driving logic.

var carriage_scene: PackedScene = preload("uid://owocnrpbo8hj")

var passed_splitters: Array[Splitter] = []

## Number between 0 and 1 indicating the position 
var speed: float:
	set(new_speed):
		speed = clamp(new_speed, 0, 1)
		%Tracks.pitch_scale = max(0.01, speed) * 0.7
		%Revving.pitch_scale = max(0.01, speed) * 0.7

		Global.game_ui.shown_speed = round(speed_curve.sample(speed) * max_speed)

@export var speed_curve: Curve

var previous_progress: float = 0

var carriage_spacing: float = 30

func _process(delta: float) -> void:
	progress += speed_curve.sample(speed) * max_speed * delta

	for i in range(len(carriages)):
		var carriage: Carriage = carriages[i]
		carriage.progress = progress - (i + 1) * carriage_spacing

	if previous_progress - progress_ratio > 0.5:
		for splitter in passed_splitters:
			splitter.enabled = true
		
		# Sync the new path after passing spawn.
		Global.track.sync_path()
		passed_splitters = []

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
		area.enabled = false
		passed_splitters.append(area)

var carriages: Array[Carriage] = []

func add_carriage(passengers: Passengers) -> void:
	var carriage: Carriage = carriage_scene.instantiate()
	carriage.passengers = passengers

	carriages.append(carriage)
	passengers.reached_destination.connect(carriage.destroy)
	Global.track.add_child(carriage)

func remove_carriage(carriage: Carriage) -> void:
	carriages.erase(carriage)
	carriage.queue_free()

### ! PASSENGER LOGIC

var passengers_boarded: Array[Passengers] = []

func board_passengers(passengers: Passengers) -> void:
	passengers.patience = passengers.max_patience
	passengers_boarded.append(passengers)
	add_carriage(passengers)
	Global.game_ui.train_timer(passengers)

func exit_passengers_at(station_name: String) -> void:
	var passengers_exited: Array[Passengers] = []
	for passengers in passengers_boarded:
		if passengers.destination.name == station_name:
			passengers_exited.append(passengers)

	for passengers in passengers_exited:
		passengers_boarded.erase(passengers)
		passengers.reached_destination.emit()

		var score_particles: ScoreParticles = ScoreParticles.new(passengers.destination.color, passengers.destination)
		Global.game_ui.add_child(score_particles)
		score_particles.play_animation()

		Global.add_score(passengers.patience/passengers.max_patience)
