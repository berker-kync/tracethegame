extends Node2D

@onready var level_transition: AnimationPlayer = $LevelTransition



func _ready() -> void:
	level_transition.play("Fade_in")
