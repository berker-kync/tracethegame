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
@onready var watch: Sprite2D = $"../PanelContainer/Watch"
@onready var laptop: Sprite2D = $"../PanelContainer2/laptop"

#audio
@onready var audio_stream_player: AudioStreamPlayer = $"../../AudioStreamPlayer"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (journalConst.person4 == true):
		who.visible = false
		job.visible = false
		purpose.visible = false
		label_who.visible = true
		label_job.visible = true
		label_purpose.visible = true
	if (journalConst.room4keyItem1 == true):
		watch.visible = true
	if (journalConst.room4keyItem2 == true):
		laptop.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (journalConst.person4 != true && who.selected == 4 && job.selected == 4 && purpose.selected == 4):
		who.visible = false
		job.visible = false
		purpose.visible = false
		label_who.visible = true
		label_job.visible = true
		label_purpose.visible = true
		journalConst.person4 = true
		audio_stream_player.play()
		
		
	if (journalConst.room4keyItem1 == true):
		watch.visible = true
		
	if (journalConst.room4keyItem2 == true):
		laptop.visible = true
