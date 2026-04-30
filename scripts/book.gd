extends Area2D
var proximity = false
@onready var highlighted: Sprite2D = $"../Sprite2D"
@onready var journal_animator: AnimationPlayer = $"../../JournalAnimator"
@onready var panel: Panel = $"../Panel"
@onready var pickupsound: AudioStreamPlayer = $"../pickupsound"
@onready var label: Label = $"../Label"

func _process(delta: float) -> void:
	if proximity == true && Input.is_action_just_pressed("interact"):
		print("interacted") 
		panel.visible = true
		label.visible = true
		journal_animator.play("Pause")
		pickupsound.play()

	if (panel.visible == true && Input.is_action_just_pressed("escape")):
		panel.visible = false
		journal_animator.play("RESET")

func _on_body_entered(body: Node2D) -> void:
	highlighted.visible = true
	proximity = true
	print("entered")

func _on_body_exited(body: Node2D) -> void:
	highlighted.visible = false
	proximity = false
	print("exited")
