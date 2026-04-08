extends Node2D

@onready var textBox = $".."

func _ready():
	# Queue all dialogue immediately when scene loads
	textBox.queueText("Welcome to the TRACE: The Game.")
	textBox.queueText("You are here on a work visit as a Digital Footprint Detective.")
	textBox.queueText("You can move using either WASD or Arrow Keys.")
	textBox.queueText("Checkout the lobby, make yourself comfortable.")
	textBox.queueText("When you're ready, talk to the receptionist by walking up to the desk and pressing Enter.")
	
	# Wait until dialogue is finished, then load lobby
	await textBox.finished  
	get_tree().change_scene_to_file("res://scenes/Lobby/HotelLobby.tscn")
