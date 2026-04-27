extends Area2D

@onready var location_time: Label = $"../../LocationTime"

func _ready():
	location_time.visible = false

func _on_mouse_entered():
	location_time.visible = true

func _on_mouse_exited():
	location_time.visible = false
