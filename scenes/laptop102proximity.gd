extends Area2D
@onready var highlighted: Sprite2D = $"../highlighted"
var laptopScene = load("res://scenes/laptop.tscn")
var in_laptop_view = false
var proximity = false
#@onready var camera_2d_3: Camera2D = $"../../Camera2D3"
@onready var laptopscreencam: Camera2D = $"../../laptopscreencam"
@onready var main_cam: Camera2D = $"../../mainCam"

func _process(delta):
	if (in_laptop_view == false && proximity == true && Input.is_action_just_pressed("interact")):
		laptopscreencam.make_current()
		in_laptop_view = true
		

	if (laptopscreencam.is_current() && Input.is_action_just_pressed("escape")):
		main_cam.make_current()
		in_laptop_view = false

func _on_body_entered(_body: Node2D) -> void:
	highlighted.visible = true
	proximity = true
	print("entered") 
	
	
func _on_body_exited(_body: Node2D) -> void:
	highlighted.visible = false
	proximity = false
	print("exited")
