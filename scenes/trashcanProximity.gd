extends Area2D
@onready var highlighted: Sprite2D = $"../Highlighted Can"
var dragscene = load("res://scenes/drag_scene.tscn")
var proximity = false
@onready var camera_2d_4: Camera2D = $"../../Camera2D4"

func _process(delta: float) -> void:
	if proximity == true && Input.is_action_just_pressed("interact"):
		print("interacted") 
		#get_tree().change_scene_to_packed(dragscene)
		camera_2d_4.make_current()
		
func _on_body_entered(_body: Node2D) -> void:
	highlighted.visible = true
	proximity = true
	print("entered") 
	
func _on_body_exited(_body: Node2D) -> void:
	highlighted.visible = false
	proximity = false
	print("exited")
