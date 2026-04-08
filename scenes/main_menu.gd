extends Node2D

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file(str("res://scenes/opening_text.tscn"))

func _on_settings_pressed() -> void:
	$CenterContainer/MainButtons.visible = false
	$CenterContainer/Settings.visible = true

func _on_credits_pressed() -> void:
	$CenterContainer/MainButtons.visible = false
	$CenterContainer/Credits.visible = true

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_back_pressed() -> void:
	$CenterContainer/Credits.visible = false
	$CenterContainer/Settings.visible = false
	$CenterContainer/MainButtons.visible = true
