extends Control
@onready var first: Label = $first
@onready var second: Label = $second
@onready var third: Label = $third
@onready var timer: Timer = $Timer
@onready var green_cam: Camera2D = $"../greenCam"
@onready var main_cam: Camera2D = $"../mainCam"
@onready var r_switch: Sprite2D = $"../Laptop/RSwitch"


@onready var control: Control = $"."

var lock = [0, 0, 0]
var j = 0
var puzzleSolved = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	first.add_theme_color_override("font_color", Color.YELLOW)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#close the suitcase lock screen
	if green_cam.is_current() == true && Input.is_action_just_pressed("escape"):
		main_cam.make_current()
	if green_cam.is_current() == true && Input.is_action_just_pressed("up"):
		uptick()
		if (j) == 0:
			first.text = str(lock[0])
		elif (j == 1):
			second.text = str(lock[1])
		elif (j == 2):
			third.text = str(lock[2])
		wincheck()
		
	if green_cam.is_current() == true && Input.is_action_just_pressed("down"):
		downtick()
		if (j) == 0:
			first.text = str(lock[0])
		elif (j == 1):
			second.text = str(lock[1])
		elif (j == 2):
			third.text = str(lock[2])
		wincheck()
	if green_cam.is_current() == true && Input.is_action_just_pressed("left"):
		if (j) == 0:
			first.add_theme_color_override("font_color", Color.WHITE)
			third.add_theme_color_override("font_color", Color.YELLOW)
		elif (j == 1):
			second.add_theme_color_override("font_color", Color.WHITE)
			first.add_theme_color_override("font_color", Color.YELLOW)
		elif (j == 2):
			third.add_theme_color_override("font_color", Color.WHITE)
			second.add_theme_color_override("font_color", Color.YELLOW)
			
		j = j - 1
		if (j < 0):
			j = 2
	if green_cam.is_current() == true && Input.is_action_just_pressed("right"):
		if (j) == 0:
			first.add_theme_color_override("font_color", Color.WHITE)
			second.add_theme_color_override("font_color", Color.YELLOW)
		elif (j == 1):
			second.add_theme_color_override("font_color", Color.WHITE)
			third.add_theme_color_override("font_color", Color.YELLOW)
		elif (j == 2):
			third.add_theme_color_override("font_color", Color.WHITE)
			first.add_theme_color_override("font_color", Color.YELLOW)
		
		j += 1
		if (j > 2):
			j = 0
func uptick():
	lock[j] += 1
	if j == 0:
		if (lock[j] > 12):
			lock[j] = 1
	else:
		lock[j] = (lock[j] % 10)
	
func downtick():
	lock[j] -= 1
	if j == 0:
		if (lock[j] < 1):
			lock[j] = 12
	else:
		if (lock[j] < 0):
			lock[j] = 9
	
	

func wincheck():
	if (lock == [1,4,5] && puzzleSolved != true):
		puzzleSolved = true
		#proximity_trigger.monitoring = false
		first.add_theme_color_override("font_color", Color.GREEN)
		second.add_theme_color_override("font_color", Color.GREEN)
		third.add_theme_color_override("font_color", Color.GREEN)
		#opensound.play()
		timer.start()
		print("timer start")
		#timer set to freeze inputs and close suitcase

func _on_timer_timeout() -> void:
	print("timer end")
	timer.stop()
	main_cam.make_current()
	r_switch.visible = false
	
	# Send text to your dialogue system instead of toggling visibility
	#suitcase_open_text.queueText("Inside the suitcase is a handwritten speech, along with an unfinished book.")
	#suitcase_open_text.queueText("Press J to open your Journal to look at key items and piece together identities.")
