extends Control

@export var new_game: PackedScene
@export var options: PackedScene

func _on_new_game_button_pressed():
	get_tree().change_scene_to_packed(new_game)


func _on_quit_button_pressed():
	get_tree().quit()
