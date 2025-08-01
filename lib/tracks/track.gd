extends Path2D
class_name Track

@export var starting_rail: Rail

func _ready() -> void:
	sync_path()

func sync_path() -> void:
	curve.clear_points()

	add_connection(starting_rail)
	
## Add the connected rail to the track.
func add_connection(connection: Rail) -> void:
	for point in connection.points:
		curve.add_point(point)

	if not connection.junction: return

	add_connection(connection.junction.get_selected_rail())
	
