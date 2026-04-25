extends Control

var attempts = 0
var max_attempts = 3
var locked = false

var password = [0, 8, 6, 5, 0]
var input = []
@onready var main_cam: Camera2D = $"../mainCam"
@onready var status_label = $PassLabel
@onready var timer: Timer = $Timer
@onready var proximity_box_watch: Area2D = $"../watch/ProximityBoxHelix"
@onready var watch: Sprite2D = $"../watch"
@onready var r_switch_2: Sprite2D = $"../Laptop/RSwitch2"
@onready var text: CanvasLayer = $"../textbox/Text"

func _ready():
	for child in $GridContainer.get_children():
		if child is Button:
			child.pressed.connect(_on_number_pressed.bind(child.text.to_int()))

	#$ResetButton.pressed.connect(reset_input)


func _on_number_pressed(num):
	if locked:
		return

	if input.size() >= 5:
		return

	input.append(num)
	status_label.text = str(input)

	if input.size() == 5:
		check_password()

func reset_attempts():
	attempts = 0

func check_password():
	if input == password:
		status_label.text = "✔ Correct!"
		timer.start()
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
func _on_timer_timeout() -> void:
	journalConst.room4keyItem1 = true
	r_switch_2.visible = false
	main_cam.make_current()
	proximity_box_watch.monitoring = false
	watch.visible = false
	text.queueText("Smartwatch added to journal")
	
