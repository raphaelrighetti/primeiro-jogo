extends Area2D


func _on_BigDiamond_body_entered(body):
	if body.name == "Player":
		GlobalVar.coins += 1
		queue_free()
