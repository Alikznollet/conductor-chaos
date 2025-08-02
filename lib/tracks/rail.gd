extends Line2D
class_name Rail
## A part of the track that can be connected to other parts.

## The rail this rail is connected to.
@export var junction: Junction

## Color of the rail. By default Transparent.
@export var color: Color = Color.TRANSPARENT

func _ready() -> void:
	default_color = Color.TRANSPARENT
