extends Area2D

var settings = load("res://scenes/Main Menu/main_menu.tscn") #this will be the paused menu got to fix that

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			print("Clicked on: Settings")
			get_tree().change_scene_to_packed(settings)
