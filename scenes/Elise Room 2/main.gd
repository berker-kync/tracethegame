extends Node2D

@onready var level_transition: AnimationPlayer = $LevelTransition
@onready var camera_2d: Camera2D = $Camera2D

func _ready() -> void:
	camera_2d.make_current()
	if Global.points == -1:
		pass
	
	
