extends Area2D

@onready var transition: AnimationPlayer = $"../../Transition2"
var proximity = false
var Lobby = load("res://scenes/Lobby/HotelLobby.tscn")

func _ready() -> void:
	# Ensure the animation_finished signal is connected
	if not transition.is_connected("animation_finished", Callable(self, "_on_transition_animation_finished")):
		transition.connect("animation_finished", Callable(self, "_on_transition_animation_finished"))

func _process(delta: float) -> void:
	if proximity and Input.is_action_just_pressed("interact"):
		transition.play("Fade_out")

func _on_body_entered(_body: Node2D) -> void:
	proximity = true
	print('entered')

func _on_body_exited(_body: Node2D) -> void:
	proximity = false
	print('exited')

func _on_transition_animation_finished(anim_name: StringName) -> void:
	if anim_name != "Fade_in":
		get_tree().change_scene_to_packed(Lobby)
