extends Area2D
class_name Station

@export var color: Color = Color.TRANSPARENT

## When empty there are no passengers at this station
var passengers: Passengers:
	set(new_passengers):
		passengers = new_passengers
		%StationProgress.passengers = new_passengers

## Null when no train is in the station.
var train: Train

func _ready() -> void:
	%StationProgress.station = self
	%StationProgress.color = color

func _process(delta: float) -> void:
	if train: # If the train passes we can board/drop the passengers
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
