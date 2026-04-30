extends Node2D
@onready var highlighted: Sprite2D = $"../highlighted"
@onready var lock_cam: Camera2D = $"../../Camera2D2"
@onready var main_cam: Camera2D = $"../../mainCam"

var proximity = false

func _process(delta: float) -> void:
	if proximity == true && Input.is_action_just_pressed("interact"):
		print("interacted") 
		lock_cam.make_current()
	if (lock_cam.is_current() && Input.is_action_just_pressed("escape")):
		main_cam.make_current()
func _on_body_entered(_body: Node2D) -> void:
	highlighted.visible = true
	proximity = true
	print("entered") 
	
	
func _on_body_exited(_body: Node2D) -> void:
	highlighted.visible = false
	proximity = false
	print("exited")
