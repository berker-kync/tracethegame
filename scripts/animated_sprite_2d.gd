extends AnimatedSprite2D

func _ready():
	play("forward")

func _on_animated_sprite_2d_animation_finished():
	if animation == "forward":
		play("backward")
	else:
		play("forward")
