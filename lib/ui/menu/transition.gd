extends CanvasLayer

func _ready() -> void:
	%AnimationPlayer.play("RESET")

func change_scene(uid: String) -> void:
	%AnimationPlayer.play("fade")
	await %AnimationPlayer.animation_finished
	var packed: PackedScene = load(uid)
	get_tree().change_scene_to_packed(packed)
	%AnimationPlayer.play_backwards("fade")
