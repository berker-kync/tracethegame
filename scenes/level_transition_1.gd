extends Area2D
#@onready var highlighted: Sprite2D = $highlighted
#@onready var game_manager: Node = $"Game Manager"
@onready var transition: AnimationPlayer = $"../../Transition"
var proximity = false

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
