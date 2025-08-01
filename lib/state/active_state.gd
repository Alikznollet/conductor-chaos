extends State
class_name ActiveState
## State where the user can actively change things in the game.

func _ready() -> void:
	type = STATE_TYPE.ACTIVE

func update(delta: float) -> void:
	if Input.is_action_pressed("accel"):
		Global.train.accelerate(delta)
	if Input.is_action_pressed("decel"):
		Global.train.decelerate(delta)
