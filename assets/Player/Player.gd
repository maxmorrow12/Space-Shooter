extends CharacterBody2D

var speed = 5
var rotate_speed = 0.08

func _physics_process(delta):
	if Input.is_action_pressed("Left"):
		rotation -= rotate_speed
	rotation = rotation - rotate_speed
	if Input.is_action_pressed("Right"):
		rotation += rotate_speed
	if Input.is_action_present("Forward"):
		velocity = velocity + Vector2(0,-speed).rotated(rotation)
	print(velocity)

	move_and_slide()
