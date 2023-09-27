extends CharacterBody2D

var Bullet = load("res://Enemy/enemy_bullet.tscn")

func _on_Area2D_body_exited(body):
	if body.name == "Player":
		body.damage(100)
		damage(100)


func _on_Timer_timeout(): 
	var Player = get_node_or_null("/root/Game/Player_container/Player")
	var Effects = get_node_or_null("root/Game/Effects")
	if Player != null and Effects != null:
		var bullet = Bullet.instantiate()
		var d = global_position.angle_to_point(Player.global_position) - PI/2
		Effects.add_child(bullet)
		bullet.rotation = d
		bullet.global_position = global_position + Vector2(0,-40).rotated(d)


func damage(d): 
	health -= d
	if health <= 0: 
		Effects = get_node_or_null("/root/Game/Effects")
		if Effects != null: 
			var explosion = Explosion.instantiate()
			Effects.add_child(explosion)
			explosion.global_position = global_position
		Global.update_score(500)
		queue_free()
		
