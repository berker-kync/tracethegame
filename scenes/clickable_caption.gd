extends Area2D
var hasSelected = false
@onready var textBox: CanvasLayer = $"../../../TextBox/textbox"


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("Clicked on: Location")
			hasSelected = true
			textBox.queueText("They have their location linked at the top of this post.")
			textBox.queueText("They also claim to be at this coffee shop often.")			
