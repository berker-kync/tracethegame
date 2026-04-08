extends Area2D
@onready var highlighted: Sprite2D = $"../highlighted"
@onready var suitcase_lock: Panel = $"../SuitcaseLock"

var lock = [0, 0, 0]
var j = 0
var puzzleSolved = false
var proximity = false

#checks every frame
func _process(delta: float) -> void:
	#opens suitcase lock screen
	if proximity == true && Input.is_action_just_pressed("interact"):
		print("interacted") 
		suitcase_lock.visible = true
	
func _on_body_entered(_body: Node2D) -> void:
	highlighted.visible = true
	proximity = true
	print("entered") 
	
	
func _on_body_exited(_body: Node2D) -> void:
	highlighted.visible = false
	proximity = false
	print("exited")


	
	
