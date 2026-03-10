extends Node

var proximity = false

func in_proximity():
	proximity = true
	print("true")
func out_proximity():
	proximity = false
	print("false")

func get_proximity():
	return proximity
