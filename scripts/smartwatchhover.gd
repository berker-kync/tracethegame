extends Area2D

@onready var label = $"../../Label"

func _ready():
	label.visible = false

func _on_mouse_entered():
	label.visible = true

func _on_mouse_exited():
	label.visible = false
