extends Area2D
var hasSelected = false
@onready var textBox: CanvasLayer = $"../../TextBox/textbox"


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("Clicked on: Name in caption")
			hasSelected = true
			textBox.queueText("They have their name included in the caption of this post.")
			textBox.queueText("Despite the fact their username does not include their actual name.")			
