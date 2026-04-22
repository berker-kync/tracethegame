extends Area2D

@onready var smile: Area2D = $"."
#@onready var smilesgram: Area2D = $"../Area2D"
@onready var background: Sprite2D = $"../Background"
@onready var post_it: Sprite2D = $"../Post-it"
@onready var settings: Area2D = $"../Settings"
@onready var smilesgram: Area2D = $"../Smilesgram"


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			print("Clicked on: Smile")
			smile.visible = false
			background.visible = false
			post_it.visible = false
			settings.visible = false
			smilesgram.visible = true
			

func _on_mouse_entered() -> void:
	pass # Replace with function body.


func _on_mouse_exited() -> void:
	pass # Replace with function body.
