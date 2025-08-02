extends Line2D
class_name Rail
## A part of the track that can be connected to other parts.

## The rail this rail is connected to.
@export var junction: Junction

func _ready() -> void:
	default_color = Color.TRANSPARENT
