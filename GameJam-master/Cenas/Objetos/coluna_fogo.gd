extends RigidBody2D

@onready var gerenciador: Node = %Gerenciador

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		var y_delta = position.y - body.position.y
		var x_delta = body.position.x - position.x
		if (y_delta > 3000):
			print("Destroy enemy")
			queue_free()
			body.jump()
		else:
			print("Decrease Health")
			gerenciador.reduzir_vida()
			if (x_delta > 0):
				body.jump_side(500)
			else:
				body.jump_side(-500)
			
