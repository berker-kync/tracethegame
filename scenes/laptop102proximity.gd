extends Area2D
@onready var highlighted: Sprite2D = $"../highlighted"
var laptopScene = load("res://scenes/laptop.tscn")
var proximity = false
#@onready var camera_2d_3: Camera2D = $"../../Camera2D3"
@onready var laptopscreencam: Camera2D = $"../../laptopscreencam"
@onready var main_cam: Camera2D = $"../../mainCam"

func _process(delta: float) -> void:
	if proximity == true && Input.is_action_just_pressed("interact"):
		print("interacted") 
		laptopscreencam.make_current()
		#get_tree().change_scene_to_packed(laptopScene)
	if laptopscreencam.is_current() == true && Input.is_action_just_pressed("escape"):
		main_cam.make_current()
func _on_body_entered(_body: Node2D) -> void:
	highlighted.visible = true
	proximity = true
	print("entered") 
	
	
func _on_body_exited(_body: Node2D) -> void:
	highlighted.visible = false
	proximity = false
	print("exited")
