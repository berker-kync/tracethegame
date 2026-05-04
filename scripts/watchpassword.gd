extends Control
@onready var textbox: CanvasLayer = $"../textbox"
@onready var panel: Panel = $"../Panel"
@onready var pixel_watch: Sprite2D = $"../PixelWatch"
@onready var label: Label = $"../Label"
@onready var control: Control = $"."
@onready var camera_2: Camera2D = $"../camera2"
@onready var timer: Timer = $Timer


var attempts = 0
var max_attempts = 3
var locked = false

var password = [0, 4, 0, 7]
var input = []

@onready var status_label = $PassLabel

func _ready():
	textbox.visible = false
	for child in $GridContainer.get_children():
		if child is Button:
			child.pressed.connect(_on_number_pressed.bind(child.text.to_int()))

	#$ResetButton.pressed.connect(reset_input)


func _on_number_pressed(num):
	if locked:
		return

	if input.size() >= 4:
		return

	input.append(num)
	status_label.text = str(input)

	if input.size() == 4:
		check_password()

func reset_attempts():
	attempts = 0

func check_password():
	if input == password:
		status_label.text = "✔ Correct!"
		reset_attempts()
		await get_tree().create_timer(1.0).timeout
		#get_tree().change_scene_to_packed(watchScreen)
		Global.points = 22
		camera_2.make_current()
		journalConst.room2keyItem2 = true
		
		textbox.queueText("It looks like they always go on the same walk in Atlanta.")
		textbox.queueText("Allowing their device to track their location means it recognises patterns.")
		

	else:
		attempts += 1
		status_label.text = "✖ Wrong! (" + str(attempts) + "/" + str(max_attempts) + ")"

		if attempts >= max_attempts:
			lock_out()
		else:
			await get_tree().create_timer(1.0).timeout
			reset_input()

func lock_out():
	locked = true
	status_label.text = "🔒 Locked out"
	timer.start()
	textbox.visible = true
	textbox.queueText("It looks like you failed the password too many times.")
	textbox.queueText("Maybe there is more evidence somewhere else in the room.")
	textbox.queueText("When you're ready, come back and try again.")
	
	for child in $GridContainer.get_children():
		if child is Button:
			child.disabled = true
	


func full_reset():
	attempts = 0
	locked = false
	reset_input()

	for child in $GridContainer.get_children():
		if child is Button:
			child.disabled = false

	status_label.text = "Enter code..."

func reset_input():
	input.clear()
	status_label.text = "Enter code..."


func _on_timer_timeout() -> void:
	full_reset()
