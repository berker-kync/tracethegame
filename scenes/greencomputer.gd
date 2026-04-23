extends Area2D
var proximity = false
@onready var highlighted: Sprite2D = $HighlightedGreen
@onready var green_cam: Camera2D = $"../greenCam"

func _process(delta: float) -> void:
	if proximity == true && Input.is_action_just_pressed("interact"):
		print("interacted") 
		green_cam.make_current()
		
	

func _on_body_entered(body: Node2D) -> void:
	highlighted.visible = true
	proximity = true
	print("entered")
	
func _on_body_exited(body: Node2D) -> void:
	highlighted.visible = false
	proximity = false
	print("exited")
