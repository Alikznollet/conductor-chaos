extends Junction
class_name Splitter

@export var connections: Array[Rail]

func _ready() -> void:
	preconnection_index = 0

var enabled: bool = true:
	set(new_enabled):
		enabled = new_enabled

		if enabled:
			connection_index = preconnection_index

var connection_index: int = 0

var preconnection_index: int = 0:
	set(new_index):
		if new_index >= len(connections): preconnection_index = 0
		else: preconnection_index = new_index

		var rail: Rail = connections[preconnection_index]
		%Stroke.modulate = rail.color	

		if enabled:
			connection_index = preconnection_index

func increment() -> void:
	preconnection_index += 1

	if enabled:
		Global.track.sync_path()

	%AnimationPlayer.stop()
	%AnimationPlayer.play("clicked")
	%AudioStreamPlayer.play()

func get_selected_rail() -> Rail:
	return connections[connection_index]

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed("left_click"):
		increment()
