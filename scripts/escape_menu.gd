extends Node2D

func _ready() -> void:
	$CenterContainer.visible = false
	
	$CenterContainer/Credits.visible = false
	$CenterContainer/Settings.visible = false
	$CenterContainer/MainButtons.visible = true


func _input(event):
	if event.is_action_pressed("Escape"):
		toggle_menu()


func toggle_menu():
	var is_visible = $CenterContainer.visible
	
	$CenterContainer.visible = !is_visible
	
	get_tree().paused = !is_visible
	
	if !is_visible:
		$CenterContainer/Credits.visible = false
		$CenterContainer/Settings.visible = false
		$CenterContainer/MainButtons.visible = true


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Lobby/HotelLobby.tscn")


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
