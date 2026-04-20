extends Area2D

@onready var transition: AnimationPlayer = $"../../Transition3"
var proximity = false
var room202 = load("res://scenes/room_202.tscn")

@onready var textbox: CanvasLayer = $"../../textbox"
var locked = true


func _ready() -> void:
	# Ensure the animation_finished signal is connected
	if not transition.is_connected("animation_finished", Callable(self, "_on_transition_animation_finished")):
		transition.connect("animation_finished", Callable(self, "_on_transition_animation_finished"))

func _process(delta: float) -> void:
	if proximity and Input.is_action_just_pressed("interact"):
		if locked == false:
			transition.play("Fade_out")
		else:
			proximity = false
			print("Interacted, locked")
			textbox.queueText("This person has a Virtual Private Network (VPN) installed, blocking my path.")
			textbox.queueText("I'll need to find another way in.")

func _on_body_entered(_body: Node2D) -> void:
	proximity = true
	print('entered')

func _on_body_exited(_body: Node2D) -> void:
	proximity = false
	print('exited')

func _on_transition_animation_finished(anim_name: StringName) -> void:
	if anim_name != "Fade_in":
		get_tree().change_scene_to_packed(room202)
