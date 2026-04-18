extends Area2D
var proximity = false

func _on_area_2d_body_entered(_body: Node2D) -> void:
	#highlighted.visible = true
	proximity = true
	print("entered") 
	
	
func _on_area_2d_body_exited(_body: Node2D) -> void:
	#highlighted.visible = false
	proximity = false
	print("exited")
