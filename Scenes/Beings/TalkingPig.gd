extends Area2D

func _on_TalkingPig_body_entered(body):
	if body.name == "Player":
		print("Olá, como você está?")
