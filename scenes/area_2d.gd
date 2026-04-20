extends Area2D

@export var zone_type := "good"

func _ready():
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)


func _on_area_entered(area):
	if area.has_method("set_zone"):
		area.set_zone(self)


func _on_area_exited(area):
	if area.has_method("clear_zone"):
		area.clear_zone(self)
