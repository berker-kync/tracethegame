extends Area2D

@onready var multiple_reciepts: Label = $"../../MultipleReciepts"

func _ready():
	multiple_reciepts.visible = false

func _on_mouse_entered():
	multiple_reciepts.visible = true

func _on_mouse_exited():
	multiple_reciepts.visible = false
