extends Junction
class_name Splitter

@export var connections: Array[Rail]

var enabled: bool = true
var connection_index: int = 0:
	set(new_index):
		if not enabled: return
		if new_index >= len(connections): connection_index = 0
		else: connection_index = new_index

func increment() -> void:
	connection_index += 1
	Global.track.sync_path()

func get_selected_rail() -> Rail:
	return connections[connection_index]

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed("left_click"):
		increment()
