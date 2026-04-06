extends Area2D

var proximity = false
var has_interacted = false

@onready var textBox = $"../tutorial text"  # make sure this points to your CanvasLayer


func _process(delta: float) -> void:
	if proximity and Input.is_action_just_pressed("interact") and !has_interacted:
		has_interacted = true
		
		# Send text to your dialogue system instead of toggling visibility
		textBox.queueText("Hello Player! Welcome to the TRACE Hotel.")
		textBox.queueText("This text is practice text.")
		
		print("interacted")


func _on_body_entered(_body: Node2D) -> void:
	proximity = true
	print("entered")


func _on_body_exited(_body: Node2D) -> void:
	proximity = false
	has_interacted = false  # reset so player can interact again later
	print("exited")
