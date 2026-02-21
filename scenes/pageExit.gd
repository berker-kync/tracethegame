extends Area2D
@onready var page: Area2D = $Arrow/Page
@onready var animation_player: AnimationPlayer = $Arrow/AnimationPlayer


func _mouse_exit() -> void:
	print("exited")
	animation_player.play("RESET")


func _on_arrow_mouse_exited() -> void:
	print("exited")
