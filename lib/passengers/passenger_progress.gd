extends Control
class_name PassengerProgress

var passengers: Passengers:
	set(new_passengers):
		passengers = new_passengers
		if passengers:
			%StationName.text = passengers.destination.name
			passengers.reached_destination.connect(_reached_destination)

			%Progress.tint_progress = passengers.destination.color
			%StationName.label_settings.font_color = passengers.destination.color

func _ready() -> void:
	%AnimationPlayer.play("pop_up")

func _reached_destination() -> void:
	%AnimationPlayer.play_backwards("pop_up")
	%Death.play()
	await %AnimationPlayer.animation_finished
	queue_free()

func _process(_delta: float) -> void:
	if passengers:
		%Progress.value = passengers.patience / passengers.max_patience * 100
