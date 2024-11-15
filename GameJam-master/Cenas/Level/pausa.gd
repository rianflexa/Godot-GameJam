extends Node

@onready var pause_panel: Panel = %PausePanel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var esc_pressed = Input.is_action_just_pressed("Pausa")
	if (esc_pressed == true):
		get_tree().paused = true
		pause_panel.show()


func _on_voltar_para_o_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Cenas/Menu/main_menu.tscn")

func _on_continuar_pressed() -> void:
	pause_panel.hide()
	get_tree().paused = false
