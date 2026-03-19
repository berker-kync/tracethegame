extends Area2D
@onready var highlighted: Sprite2D = $Highlighted


func _on_body_entered(body: Node2D) -> void:
	highlighted.visible = true
	print("entered")
	
func _on_body_exited(body: Node2D) -> void:
	highlighted.visible = false
	print("exited")
