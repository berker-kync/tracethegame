extends Panel

@onready var main_cam: Camera2D = $"../mainCam"
@onready var button: Button = $Button2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.hide()
	await get_tree().create_timer(5.0).timeout
	button.show()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_2_pressed() -> void:
	main_cam.make_current()
