extends Area2D

@export var zone_type := "bad"

func _ready():
	body_entered.connect(_on_body_entered)


func _on_body_entered(body):
	if body.has_method("on_drop_zone"):
		body.on_drop_zone(zone_type)
