extends Node2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var highlight_trigger: CollisionShape2D = $Area2D/HighlightTrigger





func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
