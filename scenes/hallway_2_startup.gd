extends Node2D
@onready var elevator_ding: AudioStreamPlayer = $ElevatorDing
@onready var player: Node2D = $Player
@onready var spawn_202: Node2D = $spawnpoints/spawn202
@onready var spawn_201: Node2D = $spawnpoints/spawn201



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	elevator_ding.play() # Replace with function body.
	if Global.hallway2 == 1:
		player.position = spawn_201.position
	elif Global.hallway2 == 2: 
		player.position = spawn_202.position
