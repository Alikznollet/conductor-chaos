extends Node

## The current train instance.
var train: Train

## The current state manager.
var state_manager: StateManager

## The current station manager.
var station_manager: StationManager

## The current camera manager.
var camera_manager: CameraManager

## The current track.
var track: Track

## The main ui of the game
var game_ui: GameUI

var pause_menu: PauseMenu

var game_over_menu: GameOverMenu

var passenger_timer: Timer

### ! Game VARIABLES

var base_patience: float = 75
var patience_variance: float = 10

## The player's current score
var score: int = 0:
	set(new_score):
		score = new_score
		score_changed.emit()
	
const base_score: float = 100
signal score_changed()

## Add score based on how much time was left to deliver the passengers.
func add_score(time_left_percent: float) -> void:
	var multiplier: float = score_curve.sample(time_left_percent)
	score += round(base_score * multiplier)

var score_curve: Curve
