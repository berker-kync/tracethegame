extends Area2D
var proximity = false
@onready var highlighted: Sprite2D = $"../Sprite2D"
@onready var journal_animator: AnimationPlayer = $"../../JournalAnimator"
@onready var panel: Panel = $"../Panel"
@onready var pickupsound: AudioStreamPlayer = $"../pickupsound"
@onready var label: Label = $"../Label"
@onready var note_cam: Camera2D = $"../../noteCam"
@onready var main_cam: Camera2D = $"../../mainCam"
@onready var textbox: CanvasLayer = $"../../TextBox/textbox"
var firstinteract = false

func _process(delta: float) -> void:
	if proximity == true && Input.is_action_just_pressed("interact") && firstinteract == false:
		firstinteract = true
		print("interacted") 
		note_cam.make_current();
		journal_animator.play("Pause")
		#pickupsound.play()
		textbox.queueText("Looks like they have left their passwords easily accessible!")
		textbox.queueText("This is very common.. many keep their password on the notes app in their phone!")
		textbox.queueText("Let's solve the puzzle to discover more.")
		textbox.queueText("Drag the passwords to the correct side on the right page.")

	
		

	if (note_cam.is_current() && Input.is_action_just_pressed("escape")):
		main_cam.make_current()
		journal_animator.play("RESET")

func _on_body_entered(body: Node2D) -> void:
	highlighted.visible = true
	proximity = true
	print("entered")

func _on_body_exited(body: Node2D) -> void:
	highlighted.visible = false
	proximity = false
	print("exited")
