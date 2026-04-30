extends Panel
@onready var textbox: CanvasLayer = $TextBox/textbox


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	textbox.queueText("Looks like they have left their passwords easily accessible!")
	textbox.queueText("This is very common.. many keep their password on the notes app in their phone!")
	textbox.queueText("Let's solve the puzzle to discover more.")
	textbox.queueText("Drag the passwords to the correct side on the right page.")




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
