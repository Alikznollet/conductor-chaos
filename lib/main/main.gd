extends Node2D

func _ready() -> void:
	Global.state_manager = %StateManager
	Global.train = %Train
	Global.track = %Track
	Global.station_manager = %StationManager
	Global.game_ui = %GameUI
	Global.passenger_timer = %PassengerTimer

	Global.station_manager.start_game()
