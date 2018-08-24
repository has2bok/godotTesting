extends Node
var speed=10



func _process(delta):
	if Input.is_action_pressed('ui_down'):
		get_node("../lifeCamera2D").position.y += speed
	if Input.is_action_pressed('ui_up'):
		get_node("../lifeCamera2D").position.y -= speed
	if Input.is_action_pressed('ui_left'):
		get_node("../lifeCamera2D").position.x-=speed
	if Input.is_action_pressed('ui_right'):
        get_node("../lifeCamera2D").position.x+=speed
	if Input.is_action_pressed('ui_page_up'):
#		print("Zoom up to "+str($lifeCamera2D.zoom))
		get_node("../lifeCamera2D").zoom+=Vector2(0.1,0.1)
#		print("page up pressed")
	if Input.is_action_pressed('ui_page_down'):
		get_node("../lifeCamera2D").zoom-=Vector2(0.1,0.1)
#		print("Zoom down to "+str($lifeCamera2D.zoom))
#		print("page down pressed")