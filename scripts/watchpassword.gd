extends Control

var attempts = 0
var max_attempts = 3
var locked = false

var password = [0, 4, 0, 7]
var input = []

@onready var status_label = $PassLabel

func _ready():
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
