extends Node
@onready var journal: TabContainer = $"../Journal"
@onready var journal_animator: AnimationPlayer = $"../JournalAnimator"


@onready var journalActive = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Journal"):
		if journalActive == true: 
			journal_animator.play("RESET")
			journal.visible = false
			journalActive = false
		else:
			journal_animator.play("Pause")
			journal.visible = true
			journalActive = true
		
