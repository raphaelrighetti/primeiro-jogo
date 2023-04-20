extends Area2D


var hp = 2

func _on_TalkingPig_body_entered(body):
	if body.name == "Player":
		print("Olá, como você está?")


func _on_TalkingPig_area_entered(area):
	if area.is_in_group("Attack"):
		$AnimatedSprite.play("Hit")

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "Hit":
		hp -= 1
	
	if hp == 0:
		queue_free()
	
	$AnimatedSprite.play("Idle")
