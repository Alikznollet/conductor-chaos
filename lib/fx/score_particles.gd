extends Control
class_name ScoreParticles

static var amount: int = 10
static var distance: float = 50
static var distance_variance: float = 15

static var explode_time: float = 0.3
static var to_score_time: float = 1
static var time_variance: float = 0.4

static var texture: Texture = preload("uid://dpb7tpxrsdymn")

var particle_color: Color

var stat: Station 

var from_pos: Vector2
var to_pos: Vector2

func _init(color: Color, station: Station) -> void:
	stat = station
	particle_color = color

func _ready() -> void:
	from_pos = stat.get_global_transform_with_canvas().get_origin()
	to_pos = Global.game_ui.score_pos

	for i in range(amount):
		var sprite: TextureRect = TextureRect.new()
		sprite.texture = texture
		sprite.modulate = particle_color
		sprite.scale = Vector2.ONE * 0.15
		add_child(sprite)

func play_animation() -> void:
	var tween: Tween
	var longest_time: float = .0
	for child in get_children():
		var angle = randf() * TAU 
		var dir = Vector2(cos(angle), sin(angle))
		var dist = distance + randf_range(-distance_variance, distance_variance)

		var vec = dist * dir
		var move_time: float = to_score_time + randf_range(-time_variance, time_variance)
		if move_time > longest_time: longest_time = move_time

		tween = create_tween()
		tween.tween_property(child, "position", from_pos + vec, explode_time).set_trans(Tween.TRANS_CIRC).from(from_pos)
		tween.tween_property(child, "position", to_pos, move_time).set_trans(Tween.TRANS_CUBIC)
		tween.play()

	var timer: SceneTreeTimer = get_tree().create_timer(explode_time + longest_time)
	await timer.timeout
	queue_free()
