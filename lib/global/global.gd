extends Node

## The current train instance.
var train: Train

## The current state manager.
var state_manager: StateManager

## The current station manager
var station_manager: StationManager

## The current track.
var track: Track

## The main ui of the game
var game_ui: GameUI

var passenger_timer: Timer

### ! Game VARIABLES

var base_patience: float = 30
var patience_variance: float = 5
