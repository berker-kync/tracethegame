extends PanelContainer

@onready var watch_description: Sprite2D = $"../watchDescription"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_mouse_entered() -> void:
	if (journalConst.room2keyItem2 == true):
		watch_description.visible = true

func _on_mouse_exited() -> void:
		watch_description.visible = false
