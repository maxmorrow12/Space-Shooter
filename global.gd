extends Node

 func_ready():
 	randomnize()

func _process(_delta):
	if Input.is_action_pressed("Quit"):
		get_tree().quit()
