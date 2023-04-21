extends KinematicBody2D

var motion = Vector2.ZERO
var speed = 200
var hp = 3
var jumps = 2
var isAttacking = false
var attackPosition = 29.25

func _process(_delta):
	motion.y += 10
	
	ground()
	move()
	jump()
	attack()
	
	motion = move_and_slide(motion, Vector2.UP)

func ground():
	if is_on_floor():
		jumps = 2
	else:
		if isAttacking == false:
			$AnimatedSprite.play("Jump")

func move():
	if Input.is_action_pressed("ui_right"):
		if isAttacking == false:
			$AnimatedSprite.play("Run")
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.offset.x = 6
		$AnimatedSprite/AttackArea/CollisionShape2D.position = Vector2(attackPosition, 0)
		motion.x = speed
	elif Input.is_action_pressed("ui_left"):
		if isAttacking == false:
			$AnimatedSprite.play("Run")
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.offset.x = -9
		$AnimatedSprite/AttackArea/CollisionShape2D.position = Vector2(-attackPosition, 0)
		motion.x = -speed
	else:
		if isAttacking == false:
			$AnimatedSprite.play("Idle")
		motion.x = 0

func jump():
	if Input.is_action_just_pressed("ui_up") and jumps > 0:
		jumps -= 1
		motion.y = -300

func attack():
	if Input.is_action_just_pressed("ui_attack"):
		$AnimatedSprite/AttackArea/CollisionShape2D.disabled = false
		isAttacking = true
		$AnimatedSprite.play("Attack")
	pass

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "Attack":
		$AnimatedSprite/AttackArea/CollisionShape2D.disabled = true
		isAttacking = false
		$AnimatedSprite.play("Idle")
