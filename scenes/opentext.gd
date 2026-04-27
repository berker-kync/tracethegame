extends CanvasLayer

signal finished

@onready var textboxContainer = $TextboxContainer
@onready var startSymbol = $TextboxContainer/MarginContainer/HBoxContainer/Start
@onready var endSymbol = $TextboxContainer/MarginContainer/HBoxContainer/End
@onready var label = $TextboxContainer/MarginContainer/HBoxContainer/Label
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer2
@onready var timer: Timer = $AudioStreamPlayer2/Timer


var CHAR_READ_RATE = 0.03

enum state {
	READY,
	READING,
	FINISHED
}

var currentState = state.READY
var textQueue = []

func _ready() -> void:
	print("starting state: READY")
	hide_textbox()
	


func _process(delta: float) -> void:
	match currentState:
			state.READY:
				if !textQueue.is_empty():
					display_text()
			state.READING:
				if Input.is_action_just_pressed("ui_accept"):
					label.visible_ratio = 1.0
					var tween = create_tween()
					if tween:
						tween.kill()
					endSymbol.text = "v"
					change_state(state.FINISHED)
			state.FINISHED:
				if Input.is_action_just_pressed("ui_accept"):
					if textQueue.is_empty():
						hide_textbox()
						emit_signal("finished")
					else:
						change_state(state.READY)
				

func queueText(nextText):
	textQueue.push_back(nextText)

func hide_textbox():
	startSymbol.text = ""
	label.text = ""
	endSymbol.text = ""
	textboxContainer.hide()
	
func show_textbox():
	startSymbol.text = "*"
	textboxContainer.show()
	
func display_text():
	var nextText = textQueue.pop_front()
	label.text = nextText
	label.visible_characters = 0  # reset typing
	
	change_state(state.READING)
	show_textbox()
	
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(label, "visible_characters", len(nextText), len(nextText) * CHAR_READ_RATE)
	tween.finished.connect(on_tween_finished)
	
	
func on_tween_finished():
	endSymbol.text = "v"
	change_state(state.FINISHED)

	
func change_state(nextState):
		currentState = nextState
		match currentState:
			state.READY:
				print("changing to state: READY")
			state.READING:
				print("changing to state: READING")
				timer.start()
			state.FINISHED:
				print("changing to state: FINISHED")
				timer.stop()
				audio.stop()

func _on_timer_timeout() -> void:
	audio.play()
