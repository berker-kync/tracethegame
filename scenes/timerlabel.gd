extends Node
@onready var timer: Timer = $Timer
@onready var label: Label = $timerlabel

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = "%02d:%02d" % time_left()
	
	

func time_left():
	var time_left = timer.time_left
	var minute = time_left / 60
	var second = int(time_left) % 60
	return [minute, second]

func _on_timer_timeout() -> void:
	pass
