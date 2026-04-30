extends Area2D
@export var proximity = false
@onready var highlighted: Sprite2D = $"../Sprite2D"
@onready var journal_animator: AnimationPlayer = $"../../JournalAnimator"
@onready var panel: Panel = $"../Panel"
@onready var pickupsound: AudioStreamPlayer = $"../pickupsound"
@onready var label: Label = $"../Label"
@onready var laptop_cam: Camera2D = $"../../laptopCam"
@onready var main_cam: Camera2D = $"../../mainCam"
@onready var textbox: CanvasLayer = $"../../TextBox/textbox"
var firstinteract = false

func _process(delta: float) -> void:
	if proximity == true && Input.is_action_just_pressed("interact"):
		#firstinteract = true
		print("interacted") 
		laptop_cam.make_current();
		journal_animator.play("Pause")
		#pickupsound.play()
		

	if (laptop_cam.is_current() && Input.is_action_just_pressed("escape")):
		main_cam.make_current()
		journal_animator.play("RESET")

func _on_body_entered(body: Node2D) -> void:
	#highlighted.visible = true
	proximity = true
	print("entered")

func _on_body_exited(body: Node2D) -> void:
	#highlighted.visible = false
	proximity = false
	print("exited")
