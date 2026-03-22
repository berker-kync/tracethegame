extends Area2D

var proximity = false
@onready var textBox = $"../textBox"


func _ready():
	textBox.visible = false


func _process(delta: float) -> void:
	if proximity and Input.is_action_just_pressed("interact"):
		textBox.visible = true
		print("interacted")


func _on_body_entered(_body: Node2D) -> void:
	proximity = true
	print("entered")


func _on_body_exited(_body: Node2D) -> void:
	proximity = false
	textBox.visible = false
	print("exited")
