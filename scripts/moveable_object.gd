extends Node2D

var dragging := false
var offset: Vector2
var start_position: Vector2

@export var item_type := "trash" # "trash" or "receipt"

func _ready():
	start_position = global_position


func _process(_delta):
	if dragging:
		global_position = get_global_mouse_position() - offset

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:

		if event.pressed:
			start_drag()

		else:
			end_drag()


func start_drag():
	dragging = true
	offset = get_global_mouse_position() - global_position


func end_drag():
	dragging = false


func on_drop_zone(zone_type):
	if not dragging:
		return

	if is_valid_drop(zone_type):
		handle_correct_drop()
	else:
		handle_wrong_drop()


func is_valid_drop(zone_type) -> bool:
	return (item_type == "receipt" and zone_type == "good") \
		or (item_type == "trash" and zone_type == "bad")


func handle_correct_drop():
	print("correct drop!")
	queue_free()


func handle_wrong_drop():
	print("wrong zone")
	global_position = start_position

func _on_area_2d_mouse_entered():
	if not dragging:
		scale = Vector2(1.05, 1.05)


func _on_area_2d_mouse_exited():
	if not dragging:
		scale = Vector2(1, 1)
