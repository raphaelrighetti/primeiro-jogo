extends Area2D


func _on_BigDiamond_body_entered(body):
	if body.name == "Player":
		print("Pegou o diamante")
		queue_free()
