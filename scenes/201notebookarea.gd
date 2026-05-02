extends Area2D

var proximity = false
var active = false
var firstinteract = false
var playText = false


@onready var highlighted: Sprite2D = $".."
@onready var journal_animator: AnimationPlayer = $"../../../JournalAnimator"
@onready var note_cam: Camera2D = $"../../../noteCam"
@onready var main_cam: Camera2D = $"../../../mainCam"
@onready var textbox: CanvasLayer = $"../../../TextBox/textbox"
@onready var laptop = get_node("../../Laptop")


func _process(delta: float) -> void:

	# ENTER NOTEBOOK
	if Global.current_interactable == self && not firstinteract and proximity and Input.is_action_just_pressed("interact"):
		firstinteract = true
		active = true

		if laptop:
			laptop.active = false

		print("notebook interacted")

		# ONLY switch to notebook camera here
		note_cam.make_current()

		#journal_animator.play("Pause")

		textbox.queueText("Looks like they have left their passwords easily accessible!")
		textbox.queueText("This is very common.. many keep their password on the notes app in their phone!")
		textbox.queueText("Let's solve the puzzle to discover more.")
		textbox.queueText("Drag the passwords to the correct side on the right page.")


	# EXIT NOTEBOOK
	if active and note_cam.is_current() and Input.is_action_just_pressed("escape"):
		active = false
		firstinteract = false

		main_cam.make_current()
		#journal_animator.play("RESET")

		if laptop:
			laptop.active = true


func _on_body_entered(body: Node2D) -> void:
	highlighted.visible = true
	Global.current_interactable = self
	proximity = true
	print("entered")


func _on_body_exited(body: Node2D) -> void:
	highlighted.visible = false
	Global.current_interactable = null
	proximity = false
	print("exited")
