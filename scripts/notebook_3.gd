extends Node

@onready var note_cam_2: Camera2D = $"../noteCam2"
@onready var main_cam: Camera2D = $"../mainCam"


func _process(delta: float) -> void:
	if note_cam_2.is_current() and Input.is_action_just_pressed("escape"):
		main_cam.make_current()
