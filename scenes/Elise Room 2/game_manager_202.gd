extends Node
@onready var journal: TabContainer = $"../Journal"
@onready var journal_animator: AnimationPlayer = $"../JournalAnimator"
@onready var camera_2d: Camera2D = $"../Camera2D"
@onready var player: Node2D = $"../Player"
@onready var playercam: Camera2D = $"../Player/playercam"


@onready var journalActive = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Journal"):
		if journalActive == true: 
			journal_animator.play("RESET")
			journal.visible = false
			journalActive = false
			playercam.make_current()
		else:
			journal_animator.play("Pause")
			camera_2d.make_current()
			journal.visible = true
			journalActive = true
		
