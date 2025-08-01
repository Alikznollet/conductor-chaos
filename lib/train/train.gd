extends PathFollow2D
class_name Train

## Number between 0 and 1 indicating the position 
var speed: float:
	set(new_speed):
		speed = clamp(new_speed, 0, 1)

@export var speed_curve: Curve

func _process(delta: float) -> void:
	progress += speed_curve.sample(speed) * max_speed * delta

@export var max_speed: float = 100

## How much speed increases per second
@export var speed_increase: float = 0.2
@export var speed_decrease: float = 0.2

func accelerate(delta: float) -> void:
	speed += speed_increase * delta

func decelerate(delta:float) -> void:
	speed -= speed_decrease * delta


