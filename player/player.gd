extends CharacterBody2D

const SPEED = 200.0
const ARRIVE_DISTANCE = 4.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var target_position: Vector2
var moving: bool = false

func _ready() -> void:
	target_position = global_position

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		_set_target(_to_world(event.position))
	elif event is InputEventScreenTouch and event.pressed:
		_set_target(_to_world(event.position))

func _to_world(viewport_point: Vector2) -> Vector2:
	return get_viewport().get_canvas_transform().affine_inverse() * viewport_point

func _set_target(point: Vector2) -> void:
	target_position = point
	moving = true

func _physics_process(_delta: float) -> void:
	if moving:
		var to_target := target_position - global_position
		if to_target.length() <= ARRIVE_DISTANCE:
			moving = false
			velocity = Vector2.ZERO
		else:
			velocity = to_target.normalized() * SPEED
			sprite.flip_h = to_target.x < 0
	else:
		velocity = Vector2.ZERO

	move_and_slide()
	_update_animation()

func _update_animation() -> void:
	sprite.play("run" if moving else "idle")
