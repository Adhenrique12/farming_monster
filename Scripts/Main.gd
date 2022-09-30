extends Node

var pause_menu := "res://Scenes/UI/StartMenu.tscn"

func _input(_event):
	if Input.is_action_pressed("pause"):
		get_tree().paused = not get_tree().paused
