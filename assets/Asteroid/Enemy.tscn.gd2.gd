extends CharacterBody2D

var Bullet = load("res://assets/Asteroid/Enemy/Enemy Bullet.tscn")
var health = 10
var y_position = [100,150,200,500,550]
var initial_position = Vector2.ZERO
var direction = Vector2(1.5,0)
var wobble = 30.0

func _ready():
	initial_position.x = -100
	initial_position.y =y_position[randi() % y_position.size() ]
	position = initial_position
	
func _physics_process(_delta):
		position += direction
		position.y = initial_position.y + sin(position.x/20)*wobble
		if position.x > 1200:
			queue_free()

func _on_timer_timeout():
	var Player = get_node_or_null("/root/Game/Player_container/PLayer")
	var Effects = get_node_or_null("root/Game/Effects")
	if Player != null and Effects != null:
		var bullet = Bullet.instantiate()
		var d =global_position.angle_to_point(Player.global_position) + PI/2
		bullet.rotation = d
		bullet.global_position = global_position + Vector2(0,-40).rotated(d)
		Effects.add_child(bullet)
		
func damage(d):
	health -= d 
	if health <= 0:
		queue_free()

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		damage(100)
		body.damage(100)
	
