extends CharacterBody2D

@export var speed = 100
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func get_input():
	# get input direction (-1, 0, 1)
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if  input_direction[0] == 0.0:
		if input_direction[1] == 0.0:
			animated_sprite.play("default")
	if input_direction[0] > 0.0:
		animated_sprite.play("walk_right")
		print("right")
	elif input_direction[0] < 0.0:
		animated_sprite.play("walk_left")
		print("left")
	if input_direction[1] < 0.0:
		animated_sprite.play("walk_up")
		print("up")
	elif input_direction[1] > 0.0:
		animated_sprite.play("walk_down")
		print("down")
		
	#if input_direction[0]  input_direction[1] == 0.0:
		#animated_sprite.play("default")
	#print(input_direction)
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
