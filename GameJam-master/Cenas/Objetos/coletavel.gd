extends Area2D

@onready var gerenciador: Node = %Gerenciador


func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		queue_free()
		gerenciador.add_points()
