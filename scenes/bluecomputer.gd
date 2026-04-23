extends Area2D
var proximity = false
@onready var highlighted: Sprite2D = $HighlightedBlue
@onready var journal_animator: AnimationPlayer = $"../JournalAnimator"
@onready var maze: Sprite2D = $"../maze"


func _process(delta: float) -> void:
	if proximity == true && Input.is_action_just_pressed("interact"):
		#if puzzle 1 is solved, open. else 
		
		
		journal_animator.play("Pause")
		maze.visible = true
		print("interacted") 
	
	if (maze.visible == true && Input.is_action_just_pressed("escape")):
		maze.visible = false
		journal_animator.play("RESET")
	#elif (maze.visible == true && Input.is_action_just_pressed("interact")):
		#maze.visible = false
		#journal_animator.play("RESET")
		
func _on_body_entered(body: Node2D) -> void:
	highlighted.visible = true
	proximity = true
	print("entered")
	
func _on_body_exited(body: Node2D) -> void:
	highlighted.visible = false
	proximity = false
	print("exited")
