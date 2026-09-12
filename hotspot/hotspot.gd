extends Area2D

signal tapped(hotspot: Area2D)

enum IdleAnimation { BOUNCE, GLOW, WIGGLE }

@export var idle_animation: IdleAnimation = IdleAnimation.BOUNCE
@export var bounce_height: float = 6.0
@export var wiggle_angle_degrees: float = 6.0
@export var animation_duration: float = 1.2

var _base_position: Vector2
var _base_scale: Vector2
var _base_modulate: Color

func _ready() -> void:
	input_pickable = true
	_base_position = position
	_base_scale = scale
	_base_modulate = modulate
	input_event.connect(_on_input_event)
	_start_idle_animation()

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	var is_mouse_tap: bool = event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT
	var is_touch_tap: bool = event is InputEventScreenTouch and event.pressed
	if is_mouse_tap or is_touch_tap:
		get_viewport().set_input_as_handled()
		_play_tap_feedback()
		tapped.emit(self)

func _play_tap_feedback() -> void:
	var tween := create_tween()
	tween.tween_property(self, "scale", _base_scale * 1.15, 0.08).set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "scale", _base_scale, 0.12).set_trans(Tween.TRANS_SINE)

func _start_idle_animation() -> void:
	match idle_animation:
		IdleAnimation.GLOW:
			_animate_glow()
		IdleAnimation.WIGGLE:
			_animate_wiggle()
		_:
			_animate_bounce()

func _animate_bounce() -> void:
	var tween := create_tween().set_loops()
	var half := animation_duration / 2.0
	tween.tween_property(self, "position:y", _base_position.y - bounce_height, half).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "position:y", _base_position.y, half).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

func _animate_glow() -> void:
	var bright := Color(_base_modulate.r * 1.3, _base_modulate.g * 1.3, _base_modulate.b * 1.3, _base_modulate.a)
	var tween := create_tween().set_loops()
	var half := animation_duration / 2.0
	tween.tween_property(self, "modulate", bright, half).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "modulate", _base_modulate, half).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

func _animate_wiggle() -> void:
	var wiggle_angle := deg_to_rad(wiggle_angle_degrees)
	var tween := create_tween().set_loops()
	var quarter := animation_duration / 4.0
	tween.tween_property(self, "rotation", wiggle_angle, quarter).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "rotation", -wiggle_angle, quarter * 2.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "rotation", 0.0, quarter).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
