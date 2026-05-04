extends Panel

@onready var winsound: AudioStreamPlayer = $winsound
@onready var note_cam_2: Camera2D = $"../noteCam2"
@onready var main_cam: Camera2D = $"../mainCam"
@onready var timer: Timer = $Timer

var has_won := false


func _process(delta: float) -> void:
	#print("points =", Global.points)

	if Global.points >= 6:
		print("WIN DETECTED")
	# WIN CONDITION (only triggers once)
	if Global.points >= 6 and not has_won:
		has_won = true

		print("win")
		Global.points = 0
		journalConst.room3keyItem1 = true
		
		winsound.play()
		timer.start()
		
		


func _on_timer_timeout() -> void:
	print("Timer finished -> switching camera")
	note_cam_2.make_current()
	timer.stop()
