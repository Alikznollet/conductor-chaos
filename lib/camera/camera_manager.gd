extends Node2D
class_name CameraManager

## The camera we are currently viewing.
var current_camera: PhantomCamera2D:
	set(new_camera):
		if current_camera: current_camera.priority = 0
		if new_camera: new_camera.priority = 1

		current_camera = new_camera

## List of all cameras available.
var cameras: Array[PhantomCamera2D]

func _ready() -> void:
	for camera in get_children():
		if camera is PhantomCamera2D:
			cameras.append(camera)

	cycle_camera()

## Cycle to the next camera mode.
func cycle_camera() -> void:
	var new_cam: PhantomCamera2D = cameras.pop_front()
	current_camera = new_cam
	cameras.append(new_cam)
