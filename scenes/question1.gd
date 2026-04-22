extends Control

@onready var grid = $GridContainer
@onready var textBox: CanvasLayer = $"../TextBox/textbox"

var buttons = []
var isCorrect = false

func _ready():
	#get_buttons()
	connect_buttons()

#func get_buttons():
#	buttons = grid.get_children().filter(func(c): return c is Button)

func connect_buttons():
	for i in range(buttons.size()):
		buttons[i].pressed.connect(_on_button_pressed.bind(i))

func _on_button_pressed(index):
	var selected_text = buttons[index].text
	print("Selected:", selected_text)
	handle_answer(index, selected_text)

func handle_answer(index, text):
	match index:
		1:
			print("Correct")
			isCorrect = true
			finishQuestion()
		_:
			print("Incorrect")
			wrong_answer()

func finishQuestion():
	textBox.QueueText("That is correct!")
	
	await get_tree().create_timer(1.5).timeout
	
	self.hide()  
	
	get_parent().show() 

func wrong_answer():
	textBox.QueueText("Try again!")
	
	for b in buttons:
		b.disabled = true
	
	await get_tree().create_timer(1.0).timeout
	
	for b in buttons:
		b.disabled = false
