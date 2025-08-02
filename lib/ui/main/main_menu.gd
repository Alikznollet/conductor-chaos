extends CanvasLayer
class_name MainMenu

func _ready() -> void:
	get_tree().paused = false
	%TitleCard.play_animation()

func _on_play_pressed() -> void:
	Transition.change_scene("uid://co3jvbpwp7vnh")

func _on_exit_pressed() -> void:
	get_tree().quit()
