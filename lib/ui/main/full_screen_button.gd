extends Control
class_name FullScreenButton

@export var fullscreen_texture: Texture
@export var minimized_texture: Texture

func _ready() -> void:
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		maximized = true
	else:
		maximized = false

var maximized: bool:
	set(new_maximized):
		maximized = new_maximized

		if maximized:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			%Button.icon = minimized_texture
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			%Button.icon = fullscreen_texture

func _on_button_pressed() -> void:
	%AudioStreamPlayer.play()
	maximized = !maximized
