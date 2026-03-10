extends Area2D
@onready var journal_arrow: Sprite2D = $Camera2D/JournalArrow
@onready var collision_shape_2d: CollisionShape2D = $Camera2D/JournalArrow/Journalpage/CollisionShape2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var area_2d: Area2D = $Area2D


func _mouse_entered(body:Node2D) -> void:
	print("journal open")
	animation_player.play("journalOpen")
	
	
