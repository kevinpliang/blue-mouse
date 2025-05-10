extends CharacterBody2D

const ACCELERATION := 70.0
const MAX_SPEED := 120.0
const FRICTION := 100.0
const TURN_SPEED := 3.0  # radians per second

var direction: Vector2 = Vector2.RIGHT

func change_sprite_per_direction() -> void:
	var vel_angle = direction.angle()
	for sprite_layer in $Sprite2D.get_children():
		sprite_layer.rotation = vel_angle

func _physics_process(delta: float) -> void:
	var input_forward = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
	var input_turn = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")

	# Rotate direction vector
	var rotation_amount = input_turn * TURN_SPEED * delta
	direction = direction.rotated(rotation_amount).normalized()

	if input_forward != 0:
		# Accelerate in direction
		velocity += direction * ACCELERATION * input_forward * delta
	else:
		# Apply friction when not accelerating
		var friction_force = FRICTION * delta
		velocity = velocity.move_toward(Vector2.ZERO, friction_force)

	# Limit speed
	if velocity.length() > MAX_SPEED:
		velocity = velocity.normalized() * MAX_SPEED

	change_sprite_per_direction()
	move_and_slide()
