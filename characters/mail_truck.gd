extends CharacterBody2D

const SPEED = 200.0

func change_sprite_per_velocity() -> void:
	if self.velocity.length() > 0:
		var vel_angle = self.velocity.angle()
		for sprite_layer in $Sprite2D.get_children():
			sprite_layer.rotation = vel_angle


func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED
	
	change_sprite_per_velocity()
	move_and_slide()
