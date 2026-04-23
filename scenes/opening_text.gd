extends Node2D

@onready var textBox = $".."

func _ready():
	# Queue all dialogue immediately when scene loads
	textBox.queueText("Welcome to the TRACE: The Game. Press Enter to forward dialoge")
	textBox.queueText("You are a digi-tective, specializing in following the trace of people's digital footprints.")
	textBox.queueText("There's been reports of a malicious user hacking into people's devices at the Digital Hotel.")
	textBox.queueText("Hotel Wi-Fi networks are often unsecured and unencrypted.")
	textBox.queueText("It's your job to find and stop this hacker from leaking more information in the hotel!")
	textBox.queueText("You can move using either WASD or Arrow Keys, and use Enter to interact.")
	textBox.queueText("When you're ready, talk to the receptionist by walking up to the desk and pressing Enter.")
	
	# Wait until dialogue is finished, then load lobby
	await textBox.finished  
	get_tree().change_scene_to_file("res://scenes/Lobby/HotelLobby.tscn")
