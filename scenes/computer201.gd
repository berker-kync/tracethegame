extends Area2D

var proximity = false
var active = true

@onready var highlighted: Area2D = $"."
@onready var laptop_cam: Camera2D = $"../../laptopCam"
@onready var main_cam: Camera2D = $"../../mainCam"

var firstinteract = false


func _process(delta: float) -> void:

	# HARD LOCK: laptop cannot run if disabled
	if not active:
		return

	if not proximity:
		return


	# OPEN LAPTOP
	if Global.current_interactable == self && proximity == true && Input.is_action_just_pressed("interact") and not firstinteract:
		firstinteract = true
		print("interacted laptop")

		laptop_cam.make_current()


	# CLOSE LAPTOP
	if laptop_cam.is_current() and Input.is_action_just_pressed("escape"):
		main_cam.make_current()
		firstinteract = false


func _on_body_entered(body: Node2D) -> void:
	highlighted.visible = true
	Global.current_interactable = self
	proximity = true
	print("entered laptop")


func _on_body_exited(body: Node2D) -> void:
	highlighted.visible = false
	Global.current_interactable = null
	proximity = false
	print("exited laptop")


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	pass # Replace with function body.
