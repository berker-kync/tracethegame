extends Area2D

var proximity = false
var active = true

#@onready var highlighted: Area2D = $"."
@onready var main_cam: Camera2D = $"../../mainCam"
@onready var phone_password_camera: Camera2D = $"../../phonePasswordCamera"
@onready var laptop = get_node("../../Laptop")
#@onready var notebook = get_node("../../Notebook/Sprite2D")



#$"../../Notebook/Sprite2D"

func _process(delta: float) -> void:

	if Global.current_interactable == self && proximity == true && Input.is_action_just_pressed("interact"):
		#firstinteract = true
		active = true

		if laptop:
			laptop.active = false
		#if notebook:
		#	notebook.active = false

		print("phone interacted")

		# ONLY switch to notebook camera here
		phone_password_camera.make_current()

	if active and phone_password_camera.is_current() and Input.is_action_just_pressed("escape"):
		active = false
		#firstinteract = false

		main_cam.make_current()

func _on_body_entered(body: Node2D) -> void:
	#highlighted.visible = true
	proximity = true
	Global.current_interactable = self
	print("entered phone")


func _on_body_exited(body: Node2D) -> void:
	#highlighted.visible = false
	proximity = false
	Global.current_interactable = null
	print("exited phone")
