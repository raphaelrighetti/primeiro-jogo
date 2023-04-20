extends KinematicBody2D

var motion = Vector2.ZERO
var speed = 200
var jumps = 2

func _process(delta):
	motion.y += 10
	
	ground()
	move()
	jump()
	
	motion = move_and_slide(motion, Vector2.UP)

func ground():
	if is_on_floor():
		jumps = 2
	else:
		$AnimatedSprite.play("Jump")

func move():
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
		$AnimatedSprite.play("Run")
	else:
		$AnimatedSprite.play("Idle")
	
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.offset.x = 6
		motion.x = speed
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.offset.x = -9
		motion.x = -speed
	else:
		motion.x = 0

func jump():
	if Input.is_action_just_pressed("ui_up") and jumps > 0:
		jumps -= 1
		motion.y = -300
