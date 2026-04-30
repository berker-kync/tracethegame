extends Node2D
@onready var smartwatch_unlock_cam: Camera2D = $smartwatchUnlockCam
@onready var main_cam: Camera2D = $mainCam


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_cam.make_current()
	if Global.points == -1:
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Global.points == 220):
		smartwatch_unlock_cam.make_current()
	if (smartwatch_unlock_cam.is_current() && Input.is_action_just_pressed("escape")):
		main_cam.make_current()
