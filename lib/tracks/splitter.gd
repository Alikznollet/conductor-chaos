extends Junction
class_name Splitter

@export var connections: Array[Rail]

func _ready() -> void:
	connection_index = 0

var enabled: bool = true:
	set(new_enabled):
		enabled = new_enabled

		if enabled:
			%AnimationPlayer.play_backwards("disable")
		else:
			%AnimationPlayer.play("disable")

var connection_index: int = 0:
	set(new_index):
		if not enabled: return
		if new_index >= len(connections): connection_index = 0
		else: connection_index = new_index

		%Stroke.modulate = get_selected_rail().color

func increment() -> void:
	connection_index += 1
	Global.track.sync_path()
	%AnimationPlayer.stop()
	%AnimationPlayer.play("clicked")

func get_selected_rail() -> Rail:
	return connections[connection_index]

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed("left_click") and enabled:
		increment()
