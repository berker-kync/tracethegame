extends Area2D

@onready var arrow: Area2D = $"."
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var page: Area2D = $Page

func _mouse_enter() -> void:
	print("entered")
	animation_player.play("arrowHoverAnimation")

func _mouse_exit() -> void:
	print("exited")
	animation_player.play("RESET")
