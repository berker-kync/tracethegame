extends PanelContainer
@onready var panel_container: PanelContainer = $"."

@onready var note_description: Sprite2D = $"../noteDescription"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_mouse_entered() -> void:
	if (journalConst.room1keyItem2 == true):
		note_description.visible = true

func _on_mouse_exited() -> void:
		note_description.visible = false
