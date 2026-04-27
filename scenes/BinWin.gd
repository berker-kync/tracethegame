extends Node2D
@onready var timer: Timer = $Timer
var room102_2 = load("res://scenes/room_102_2.tscn")
@onready var winsound: AudioStreamPlayer = $winsound
@onready var main_cam: Camera2D = $"../mainCam"
@onready var proximity_box: Area2D = $"../TrashCan/ProximityBox"
@onready var room_text: CanvasLayer = $"../textbox/roomText"
@onready var binCam: Camera2D = $"../Camera2D4"

var points = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("escape"):		
		if binCam.is_current():
			main_cam.make_current()
	
	if Global.points == 3:
		print("win")
		Global.points = 0
		timer.start()
		winsound.play()
		proximity_box.set_process(false)
		journalConst.room2keyItem1 = true



func _on_timer_timeout() -> void:
	#get_tree().change_scene_to_packed(room102_2)
	main_cam.make_current()
	timer.stop()
	room_text.queueText("One of these papers was a receipt! Press J to see more info in the journal.")
