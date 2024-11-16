extends Node


func _on_jogar_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/Level/level1.tscn")
	
	
func _on_creditos_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/Menu/creditos.tscn")
