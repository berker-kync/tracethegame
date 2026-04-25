extends TabContainer
var ending = load("res://scenes/ending.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if journalConst.person1 == true && journalConst.person2 == true && journalConst.person3 == true && journalConst.person4 == true:
		get_tree().change_scene_to_packed(ending)
