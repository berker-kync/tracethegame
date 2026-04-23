extends Camera2D
@onready var lock_cam: Camera2D = $"."
@onready var camera_2d: Camera2D = $"../Camera2D"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("escape"):		
		if lock_cam.is_current():
			camera_2d.make_current()
		
