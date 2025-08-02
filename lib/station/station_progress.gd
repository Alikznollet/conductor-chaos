extends Control
class_name StationProgress

## The tween that controls the scale of this progress.
var tween: Tween

var passengers: Passengers:
	set(new_passengers):
		passengers = new_passengers

		if passengers:
			%AnimationPlayer.play("bounce")
		else:
			%AnimationPlayer.play("RESET")

var color: Color = Color.TRANSPARENT:
	set(new_color):
		%Progress.tint_progress = new_color
		%StationName.label_settings.font_color = new_color

var station: Station:
	set(new_station):
		if new_station:
			%StationName.text = new_station.name

func _process(_delta: float) -> void:
	if passengers:
		%Progress.value = passengers.patience / passengers.max_patience * 100
		if %Progress.value <= 25:
			%AnimationPlayer.speed_scale = 2
		elif %Progress.value <= 50:
			%AnimationPlayer.speed_scale = 1.5
		
	else:
		%AnimationPlayer.speed_scale = 1
		%Progress.value = 100
