extends Node2D
@onready var elevator_ding: AudioStreamPlayer = $ElevatorDing


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	elevator_ding.play() # Replace with function body.
