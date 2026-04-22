extends Area2D
var hasSelected = false
@onready var textBox: CanvasLayer = $"../../TextBox/textbox"



func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("Clicked on: Name in comment")
			hasSelected = true
			textBox.queueText("Someone has commented their full name!")
			textBox.queueText("Now we know this, we can figure out more about them.")			
