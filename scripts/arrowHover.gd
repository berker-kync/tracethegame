extends Area2D

@onready var arrow: Area2D = $"."
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _mouse_enter() -> void:
	print("entered")
	animation_player.play("Journal_open")

func _mouse_exit() -> void:
	print("exited")
	animation_player.play("Journal_close")
