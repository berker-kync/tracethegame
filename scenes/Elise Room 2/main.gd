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
	
func _process(delta: float) -> void:
	if (Global.points == 220):
		smartwatch_unlock_cam.make_current()
	if (smartwatch_unlock_cam.is_current() && Input.is_action_just_pressed("escape")):
		main_cam.make_current()


	
