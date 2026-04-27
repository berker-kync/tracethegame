extends Area2D

@onready var location_info: Label = $"../../LocationInfo"

func _ready():
	location_info.visible = false

func _on_mouse_entered():
	location_info.visible = true

func _on_mouse_exited():
	location_info.visible = false
