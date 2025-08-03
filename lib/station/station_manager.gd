extends Node2D
class_name StationManager

var stations: Dictionary[String, Station] = {}

@export var decrease_time_between_passengers: float
@export var min_time_between_passengers: float

func _ready() -> void:
	for station in get_children():
		if station is Station:
			stations[station.name] = station

func start_game() -> void:
	Global.passenger_timer.timeout.connect(new_passengers)
	new_passengers()

## Add new passengers to a random station where possible, otherwise we just don't do anything.
func new_passengers() -> void:
	Global.passenger_timer.wait_time =  max(min_time_between_passengers, Global.passenger_timer.wait_time - decrease_time_between_passengers)
	var possible_stations: Array[Station] = stations.values()

	possible_stations.shuffle()
	for station in possible_stations:
		if not station.passengers:
			var possible_destinations: Array[Station] = possible_stations.filter(func(stat): return not stat.name == station.name)
			station.passengers = Passengers.new(
				Global.base_patience + randf_range(-Global.patience_variance, Global.patience_variance),
				possible_destinations.pick_random()
			)
			return
