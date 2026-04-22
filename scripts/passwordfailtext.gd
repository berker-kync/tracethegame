extends Node2D

@onready var textBox = $".."

func _ready():
	textBox.queueText("It looks like you failed the password too many times.")
	textBox.queueText("Maybe there is more evidence somewhere else in the room.")
	textBox.queueText("When you're ready, come back and try again.")

#	await textBox.finished  
	#get_tree().change_scene_to_file("res://scenes/room_102.tscn")
