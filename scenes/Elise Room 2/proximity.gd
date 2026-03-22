extends Area2D
@onready var highlighted: Sprite2D = $"../highlighted"

var proximity = false

func _process(delta: float) -> void:
	if proximity == true && Input.is_action_just_pressed("interact"):
		print("interacted") 

func _on_body_entered(_body: Node2D) -> void:
	highlighted.visible = true
	proximity = true
	print("entered") 
	
	
func _on_body_exited(_body: Node2D) -> void:
	highlighted.visible = false
	proximity = false
	print("exited")
