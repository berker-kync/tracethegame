extends Node2D

@onready var area = $Area2D

var hovering_body = null


func _ready():
	area.body_entered.connect(_on_body_entered)
	area.body_exited.connect(_on_body_exited)


func _on_body_entered(body):
	if body.is_in_group("draggable"):
		hovering_body = body
		Global.droppable = true
		Global.drop_position = global_position  # optional but useful
		print("in zone")


func _on_body_exited(body):
	if body == hovering_body:
		hovering_body = null
		Global.droppable = false
		Global.drop_position = null
		print("out of zone")

func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
