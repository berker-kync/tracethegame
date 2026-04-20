extends Area2D

var proximity = false
var has_interacted = false


func _on_body_entered(_body: Node2D) -> void:
	proximity = true
	print("entered")


func _on_body_exited(_body: Node2D) -> void:
	proximity = false
	has_interacted = false  # reset so player can interact again later
	print("exited")
