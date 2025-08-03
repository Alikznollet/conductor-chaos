extends PathFollow2D
class_name Carriage

var passengers: Passengers:
	set(new_passengers):
		passengers = new_passengers
		if passengers:
			%Under.modulate = passengers.destination.color

func destroy() -> void:
	Global.train.remove_carriage(self)
