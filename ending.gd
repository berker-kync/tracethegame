extends Node2D
@onready var text: CanvasLayer = $textbox/Text
var nextlevel = load("res://scenes/hallway_1.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text.queueText("Well done! You pieced together all the identities and stopped the Hacker from causing more damage")
	text.queueText("And hopefully, learned more about digital footprints along the way.")
	text.queueText("Thank you for playing!")
