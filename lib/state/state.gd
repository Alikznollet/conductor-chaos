extends Node
class_name State

enum STATE_TYPE {
	NONE,

	ACTIVE,
	INACTIVE
}

var type: STATE_TYPE = STATE_TYPE.NONE

func enter() -> void:
	pass

func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass
