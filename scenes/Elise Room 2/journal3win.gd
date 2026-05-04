extends Node
#option boxes
@onready var who: OptionButton = $"../Who"
@onready var job: OptionButton = $"../Job"
@onready var purpose: OptionButton = $"../Purpose"

#labels
@onready var label_who: Label = $"../LabelWho"
@onready var label_job: Label = $"../LabelJob"
@onready var label_purpose: Label = $"../LabelPurpose"

#key items
@onready var notebook: Sprite2D = $"../PanelContainer1/Notebook"
@onready var phone: Sprite2D = $"../PanelContainer2/Phone"

#audio
@onready var audio_stream_player: AudioStreamPlayer = $"../../AudioStreamPlayer"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (journalConst.person3 == true):
		who.visible = false
		job.visible = false
		purpose.visible = false
		label_who.visible = true
		label_job.visible = true
		label_purpose.visible = true
	if (journalConst.room3keyItem1 == true):
		pass
	if (journalConst.room3keyItem2 == true):
		phone.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (journalConst.person3 != true && who.selected == 5 && job.selected == 8 && purpose.selected == 1):
		who.visible = false
		job.visible = false
		purpose.visible = false
		label_who.visible = true
		label_job.visible = true
		label_purpose.visible = true
		journalConst.person3 = true
		audio_stream_player.play()
		
		
	if (journalConst.room3keyItem1 == true):
		notebook.visible = true
		#note.visible = true
		
		
	if (journalConst.room3keyItem2 == true):
		phone.visible = true
		
