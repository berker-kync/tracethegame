extends PanelContainer
@onready var watch_description: Sprite2D = $"../WatchDescription"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_mouse_entered() -> void:
	if (journalConst.room4keyItem1 == true):
		watch_description.visible = true
		#A smart watch with a two-factor authentification app installed.
		#oddly, the clock is stuck to 1:45


func _on_mouse_exited() -> void:
		watch_description.visible = false
