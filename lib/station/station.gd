extends Area2D
class_name Station

var timer_scene: PackedScene = preload("uid://d10fj4d10l5ak")

## When empty there are no passengers at this station
var passengers: Passengers:
	set(new_passengers):
		passengers = new_passengers
		if new_passengers:
			var station_progress: StationProgress = timer_scene.instantiate()
			station_progress.passengers = new_passengers
			station_progress.station = self
			%PassengersControl.add_child(station_progress)
		else:
			for child in %PassengersControl.get_children():
				child.queue_free()

## Null when no train is in the station.
var train: Train

func _process(delta: float) -> void:
	if train and train.speed == 0: # If the train has stopped we can board the passengers.
		if passengers:
			train.board_passengers(passengers)
			passengers = null

		train.exit_passengers_at(name)

	# Decrease the patience of the passengers.
	if passengers:
		passengers.patience -= delta
		
func _on_area_exited(_area: Area2D) -> void:
	train = null

func _on_area_entered(area:Area2D) -> void:
	train = area.get_parent() # We know this will be train because of the collision layer.

