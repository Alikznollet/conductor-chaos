extends Node
class_name StateManager

var states: Dictionary[State.STATE_TYPE, State] = {}

var current_state: State

@export var initial_state: State

func _ready() -> void:
	for state in get_children():
		if state is State:
			states[state.type] = state

	current_state = initial_state
	current_state.enter()

func change_state(type: State.STATE_TYPE) -> void:
	if not states.has(type): return ## No State matches this type.
	if current_state: current_state.exit()

	var new_state: State = states[type]

	new_state.enter()
	current_state = new_state

func _process(delta: float) -> void:
	if current_state: current_state.update(delta)
