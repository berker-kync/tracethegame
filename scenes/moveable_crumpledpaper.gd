extends Area2D

var dragging := false
var offset: Vector2
var start_position: Vector2

var current_zone = null
var drop_processed := false

@export var item_type := "receipt"


func _ready():
	start_position = global_position


func _process(_delta):
	if dragging:
		global_position = get_global_mouse_position() - offset

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:

		if event.pressed:
			start_drag()

		else:
			end_drag()


func start_drag():
	dragging = true
	drop_processed = false
	offset = get_global_mouse_position() - global_position


func end_drag():
	dragging = false
	check_drop()

func check_drop():
	if drop_processed:
		return

	drop_processed = true

	# no zone = reset
	if current_zone == null:
		reset_position()
		return

	var zone_type = current_zone.zone_type

	if is_correct(zone_type):
		handle_correct()
	else:
		handle_wrong()


func is_correct(zone_type) -> bool:
	return (item_type == "receipt" and zone_type == "good") \
		or (item_type == "trash" and zone_type == "bad")


func handle_correct():
	print("correct drop!")
	queue_free()


func handle_wrong():
	print("wrong zone")
	reset_position()


func reset_position():
	global_position = start_position

func set_zone(zone):
	current_zone = zone


func clear_zone(zone):
	if current_zone == zone:
		current_zone = null
