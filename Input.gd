extends Node

func _process(delta):
	if Input.is_action_just_pressed('ui_accept'):
		
		print("space bar pressed")
		get_tree().paused = false