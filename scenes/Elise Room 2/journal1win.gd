extends Node
@onready var who: OptionButton = $"../Who"
@onready var job: OptionButton = $"../Job"
@onready var purpose: OptionButton = $"../Purpose"
@onready var label_who: Label = $"../LabelWho"
@onready var label_job: Label = $"../LabelJob"
@onready var label_purpose: Label = $"../LabelPurpose"
@onready var book: Sprite2D = $"../PanelContainer/Book"
@onready var note: Sprite2D = $"../PanelContainer2/Note"
@onready var audio_stream_player: AudioStreamPlayer = $"../../AudioStreamPlayer"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (journalConst.person1 == true):
		who.visible = false
		job.visible = false
		purpose.visible = false
		label_who.visible = true
		label_job.visible = true
		label_purpose.visible = true
	if (journalConst.room1keyItem1 == true):
		book.visible = true
	if (journalConst.room1keyItem2 == true):
		note.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (journalConst.person1 != true && who.selected == 3 && job.selected == 1 && purpose.selected == 3):
		who.visible = false
		job.visible = false
		purpose.visible = false
		label_who.visible = true
		label_job.visible = true
		label_purpose.visible = true
		journalConst.person1 = true
		audio_stream_player.play()
		
		
	if (journalConst.room1keyItem1 == true):
		book.visible = true
	if (journalConst.room1keyItem2 == true):
		note.visible = true
