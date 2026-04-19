extends Area2D

var proximity = false
var has_interacted = false

@onready var textBox = $"../tutorial text"  # make sure this points to your CanvasLayer


func _process(delta: float) -> void:
	if proximity and Input.is_action_just_pressed("interact") and !has_interacted:
		has_interacted = true
		
		# Send text to your dialogue system instead of toggling visibility
		textBox.queueText("Hello Player! Welcome to the TRACE Hotel.")
		textBox.queueText("The best digital hotel in the whole world!..")
		textBox.queueText("..or only.")
		textBox.queueText("It is your job to figure out who is staying in this hotel")
		textBox.queueText("based on the clues from their digital footprint!")
		textBox.queueText("I believe one of the people is someone specific you're looking for.")
		textBox.queueText("Well player, good luck! Head over to the elevator and press Enter.")
		textBox.queueText("Begin your journey at Floor 1.")

		
		print("interacted")


func _on_body_entered(_body: Node2D) -> void:
	proximity = true
	print("entered")


func _on_body_exited(_body: Node2D) -> void:
	proximity = false
	has_interacted = false  # reset so player can interact again later
	print("exited")
