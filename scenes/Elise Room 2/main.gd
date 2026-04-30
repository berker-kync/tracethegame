extends Node2D

@onready var level_transition: AnimationPlayer = $LevelTransition
@onready var main_cam: Camera2D = $mainCam
@onready var timer: Timer = $Timer
@onready var smartwatch_unlock_cam: Camera2D = $smartwatchUnlockCam

func _ready() -> void:
	main_cam.make_current()
	if Global.points == -1:
		pass
	#timer.start()
	



	
