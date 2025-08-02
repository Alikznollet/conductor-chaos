extends Control
class_name StationProgress

var passengers: Passengers

var station: Station:
	set(new_station):
		if new_station:
			%StationName.text = new_station.name

func _process(_delta: float) -> void:
	if passengers:
		%Progress.value = passengers.patience / passengers.max_patience * 100
