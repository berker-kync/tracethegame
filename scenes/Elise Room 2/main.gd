extends Node2D

@onready var level_transition: AnimationPlayer = $LevelTransition
@onready var main_cam: Camera2D = $mainCam

func _ready() -> void:
	main_cam.make_current()
	if Global.points == -1:
		pass
	
	
