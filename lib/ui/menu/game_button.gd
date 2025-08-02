@tool
extends TextureRect
class_name GameButton

signal pressed()

func _on_button_mouse_exited() -> void:
	%AnimationPlayer.play_backwards("hover")

func _on_button_mouse_entered() -> void:
	%AnimationPlayer.play("hover")

func _on_button_pressed() -> void:
	pressed.emit()
	%AudioStreamPlayer.play()
