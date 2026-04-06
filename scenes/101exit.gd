extends Area2D
#@onready var highlighted: Sprite2D = $highlighted
#@onready var game_manager: Node = $"Game Manager"
@onready var transition: AnimationPlayer = $"../../Transition"
@onready var player = $"../../Player"

var proximity = false
var hallway = load("res://scenes/hallway_1.tscn")

#func _ready():
	#match Global.entry_point:
		#"FromHallway1":
			#player.global_position
		#"FromHallway1":
		#	player.global_position = $exit101Marker2


func _process(delta: float) -> void:
	if proximity == true && Input.is_action_just_pressed("interact"):
		print("interacted") 
		transition.play("Fade_out")
		#level transition

func _on_body_entered(_body: Node2D) -> void:
	#highlighted.visible = true
	proximity = true
	print("entered") 
	
	
func _on_body_exited(_body: Node2D) -> void:
	#highlighted.visible = false
	proximity = false
	print("exited")


func _on_transition_animation_finished(anim_name: StringName) -> void:
	if anim_name != "Fade_in":
		get_tree().change_scene_to_packed(hallway)
