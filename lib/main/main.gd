extends Node2D

@export var score_curve: Curve

func _ready() -> void:
	get_tree().paused = false

	Global.state_manager = %StateManager
	Global.train = %Train
	Global.track = %Track
	Global.station_manager = %StationManager
	Global.camera_manager = %CameraManager
	Global.game_ui = %GameUI
	Global.passenger_timer = %PassengerTimer
	Global.pause_menu = %PauseMenu
	Global.game_over_menu = %GameOver

	Global.score_curve = score_curve

	Global.station_manager.start_game()
