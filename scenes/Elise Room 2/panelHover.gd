extends PanelContainer
@onready var book_description: Sprite2D = $"../BookDescription"

@onready var panel_container: PanelContainer = $"."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_mouse_entered() -> void:
	if (journalConst.room1keyItem1 == true):
		book_description.visible = true


func _on_mouse_exited() -> void:
		book_description.visible = false
