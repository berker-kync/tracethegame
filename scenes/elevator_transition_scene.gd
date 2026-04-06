extends Node2D

func _on_lobby_pressed() -> void:
	get_tree().change_scene_to_file(str("res://scenes/Lobby/HotelLobby.tscn"))

func _on_floor_1_pressed() -> void:
	get_tree().change_scene_to_file(str("res://scenes/hallway_1.tscn"))

func _on_floor_2_pressed() -> void:
	get_tree().change_scene_to_file(str("res://scenes/hallway_2.tscn"))
