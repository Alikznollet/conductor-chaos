extends Junction
class_name Combiner
## Combines 2 or more rails into one.

@export var connection: Rail

func get_selected_rail() -> Rail:
	return connection
