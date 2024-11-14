extends Node

@onready var pontos: Label = %Pontos
@export var lifepoints: Array[Node] = []

var points = 0
var vida = 3

func reduzir_vida():
	vida -= 1
	print(vida)
	
	for h in range(3):
		if h < vida:
			lifepoints[h].show()  
		else:
			lifepoints[h].hide()
	
	if vida == 0:
		get_tree().reload_current_scene()

func add_points():
	points += 1
	print(points)
	pontos.text = "Pontos: " + str(points)
