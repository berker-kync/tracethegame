extends Node2D
@onready var timer: Timer = $Timer
var room102_2 = load("res://scenes/room_102_2.tscn")
@onready var winsound: AudioStreamPlayer = $winsound

var points = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.points == 3:
		print("win")
		Global.points = 0
		timer.start()
		winsound.play()



func _on_timer_timeout() -> void:
	get_tree().change_scene_to_packed(room102_2)
