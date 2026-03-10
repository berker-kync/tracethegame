extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D 

const SPEED = 100.0
func _physics_process(_delta: float) -> void:
	
	var direction := Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)

	if direction.length() > 0:
		direction = direction.normalized()
		velocity = direction * SPEED
		
		# Decide animation based on dominant direction
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				animated_sprite.play("move_right")
			else:
				animated_sprite.play("move_left")
		else:
			if direction.y > 0:
				animated_sprite.play("move_down")
			else:
				animated_sprite.play("move_up")
	else:
		velocity = Vector2.ZERO
		animated_sprite.play("idle")

	move_and_slide()
