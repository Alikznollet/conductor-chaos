extends Resource
class_name Passengers
## The passengers the train has to bring from station X to Y

signal reached_destination()

signal passengers_pissed()

var destination: Station

## When patience hits 0 in any phase the game is over.
## Patience is changed by the process function of either station or the train.
var patience: float:
	set(new_patience):
		patience = new_patience

		if patience < 0: Global.game_over_menu.game_over_animation()
## TODO: Hook this up with the game-over.

var max_patience: float

func _init(max_patience_start: float, dest: Station) -> void:
	max_patience = max_patience_start
	patience = max_patience

	destination = dest

