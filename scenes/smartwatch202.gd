extends Area2D
var proximity = false
@onready var highlighted: Sprite2D = $"../highlighted"
@onready var watchlockcam: Camera2D = $"../../watchlockcam"
@onready var main_cam: Camera2D = $"../../mainCam"


func _process(delta: float) -> void:
	if proximity == true && Input.is_action_just_pressed("interact"):
		print("interacted") 
		watchlockcam.make_current()
	if watchlockcam.is_current() && Input.is_action_just_pressed("escape"):
		main_cam.make_current()
func _on_body_entered(body: Node2D) -> void:
	highlighted.visible = true
	proximity = true
	print("entered")
	
func _on_body_exited(body: Node2D) -> void:
	highlighted.visible = false
	proximity = false
	print("exited")
