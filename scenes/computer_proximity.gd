extends Area2D
var proximity = false
@onready var highlighted: Sprite2D = $"../Highlighted"
@onready var camera_2d: Camera2D = $"../../Laptop/Camera2D"
@onready var main_cam: Camera2D = $"../../mainCam"
@onready var r_switch: Sprite2D = $"../../Laptop/RSwitch"
@onready var r_switch_2: Sprite2D = $"../../Laptop/RSwitch2"
@onready var lock: Sprite2D = $"../../Laptop/Lock"
@onready var g_switch: Sprite2D = $"../../Laptop/GSwitch"
@onready var g_switch_2: Sprite2D = $"../../Laptop/GSwitch2"
@onready var panel: Panel = $"../../Laptop/Panel"
@onready var _1: Label = $"../../Laptop/1"
@onready var _2: Label = $"../../Laptop/2"

@onready var text: CanvasLayer = $"../../textbox/Text"
@onready var timer: Timer = $"../../countdown/Timer"

var first_check = true

func _process(delta: float) -> void:
	if proximity == true && Input.is_action_just_pressed("interact"):
		print("interacted") 
		camera_2d.make_current()
		if r_switch.visible == false && r_switch_2.visible == false:
			lock.visible = false
			g_switch.visible = false
			g_switch_2.visible = false
			panel.visible = false
			lock.visible = false
			_1.visible = false
			_2.visible = false
			timer.stop()
			if first_check == true:
				text.queueText("Looks like the hacker 'Cody Hackins' was planning on selling the data of the other guests.")
				text.queueText("These files should be more than enough evidence to solidify his identity and bag him.")
				first_check = false
				journalConst.room4keyItem2 = true
 

	if camera_2d.is_current() && Input.is_action_just_pressed("escape"):
		main_cam.make_current()

func _on_body_entered(body: Node2D) -> void:
	highlighted.visible = true
	proximity = true
	print("entered")
	
func _on_body_exited(body: Node2D) -> void:
	highlighted.visible = false
	proximity = false
	print("exited")
