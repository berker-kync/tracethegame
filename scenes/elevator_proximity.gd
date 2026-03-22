extends Area2D
var proximity = false
#@onready var highlighted: Sprite2D = $highlighted
#@onready var game_manager: Node = $"Game Manager"

func _process(delta: float) -> void:
	if proximity == true && Input.is_action_just_pressed("interact"):
		print("interacted") 

func _on_body_entered(body: Node2D) -> void:
	#highlighted.visible = true
	proximity = true
	print("entered")
	
func _on_body_exited(body: Node2D) -> void:
	#highlighted.visible = false
	proximity = false
	print("exited")
