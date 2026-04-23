extends Area2D
@onready var highlighted: Sprite2D = $"../highlighted"
var laptopScene = load("res://scenes/laptop.tscn")
var proximity = false
@onready var camera_2d_3: Camera2D = $"../../Camera2D3"

func _process(delta: float) -> void:
	if proximity == true && Input.is_action_just_pressed("interact"):
		print("interacted") 
		camera_2d_3.make_current()
		#get_tree().change_scene_to_packed(laptopScene)

func _on_body_entered(_body: Node2D) -> void:
	highlighted.visible = true
	proximity = true
	print("entered") 
	
	
func _on_body_exited(_body: Node2D) -> void:
	highlighted.visible = false
	proximity = false
	print("exited")
