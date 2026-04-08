extends Panel
@onready var panel: Panel = $"."
@onready var label: Label = $Label
@onready var label_2: Label = $Label2
@onready var label_3: Label = $Label3
@onready var opensound: AudioStreamPlayer = $AudioStreamPlayer

var lock = [0, 0, 0]
var j = 0
var puzzleSolved = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.add_theme_color_override("font_color", Color.YELLOW)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#close the suitcase lock screen
	if panel.visible == true && Input.is_action_just_pressed("escape"):
		panel.visible = false
	
	if panel.visible == true && Input.is_action_just_pressed("up"):
		uptick()
		if (j) == 0:
			label.text = str(lock[0])
		elif (j == 1):
			label_2.text = str(lock[1])
		elif (j == 2):
			label_3.text = str(lock[2])
		wincheck()
		
	if panel.visible == true && Input.is_action_just_pressed("down"):
		downtick()
		if (j) == 0:
			label.text = str(lock[0])
		elif (j == 1):
			label_2.text = str(lock[1])
		elif (j == 2):
			label_3.text = str(lock[2])
		wincheck()
	if panel.visible == true && Input.is_action_just_pressed("left"):
		if (j) == 0:
			label.add_theme_color_override("font_color", Color.WHITE)
			label_3.add_theme_color_override("font_color", Color.YELLOW)
		elif (j == 1):
			label_2.add_theme_color_override("font_color", Color.WHITE)
			label.add_theme_color_override("font_color", Color.YELLOW)
		elif (j == 2):
			label_3.add_theme_color_override("font_color", Color.WHITE)
			label_2.add_theme_color_override("font_color", Color.YELLOW)
			
		j = j - 1
		if (j < 0):
			j = 2
	if panel.visible == true && Input.is_action_just_pressed("right"):
		if (j) == 0:
			label.add_theme_color_override("font_color", Color.WHITE)
			label_2.add_theme_color_override("font_color", Color.YELLOW)
		elif (j == 1):
			label_2.add_theme_color_override("font_color", Color.WHITE)
			label_3.add_theme_color_override("font_color", Color.YELLOW)
		elif (j == 2):
			label_3.add_theme_color_override("font_color", Color.WHITE)
			label.add_theme_color_override("font_color", Color.YELLOW)
		
		j += 1
		if (j > 2):
			j = 0
func uptick():
	lock[j] += 1
	lock[j] = (lock[j] % 10)
	
func downtick():
	lock[j] -= 1
	if (lock[j] < 0):
		lock[j] = 9

func wincheck():
	if lock == [1,5,7]:
		puzzleSolved = true
		label.add_theme_color_override("font_color", Color.GREEN)
		label_2.add_theme_color_override("font_color", Color.GREEN)
		label_3.add_theme_color_override("font_color", Color.GREEN)
		opensound.play()
		#timer set to freeze inputs and close suitcase
