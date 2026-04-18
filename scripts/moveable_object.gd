extends Node2D

var dragging := false
var offset: Vector2

func _process(_delta):
	if dragging:
		global_position = get_global_mouse_position() - offset


func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			
			if event.pressed:
				# Start dragging
				dragging = true
				offset = get_global_mouse_position() - global_position
			
			else:
				# Stop dragging
				dragging = false
				
func _on_area_2d_mouse_entered():
	if not dragging:
		scale = Vector2(1.05, 1.05)

func _on_area_2d_mouse_exited():
	if not dragging:
		scale = Vector2(1, 1)
