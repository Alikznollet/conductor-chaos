extends Control
class_name PassengerProgress

var passengers: Passengers:
	set(new_passengers):
		passengers = new_passengers
		if passengers:
			%StationName.text = passengers.destination.name
			passengers.reached_destination.connect(queue_free)

			%Progress.tint_progress = passengers.destination.color
			%StationName.label_settings.font_color = passengers.destination.color

func _process(_delta: float) -> void:
	if passengers:
		%Progress.value = passengers.patience / passengers.max_patience * 100
