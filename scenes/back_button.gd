extends Area2D
@onready var smilesgram: Area2D = $".."
@onready var background: Sprite2D = $"../../Background"
@onready var settings: Area2D = $"../../Settings"
@onready var textBox: CanvasLayer = $"../TextBox/textbox"
@onready var smile: Area2D = $"../../Smile"
@onready var post_it: Sprite2D = $"../../Post-it"

# Called when the node enters the scene tree for the first time.
func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			print("Clicked on: Back Button")
			smilesgram.visible = false
			background.visible = true
			post_it.visible = true
			#settings.visible = true
			smile.visible = true
