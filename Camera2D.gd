extends Camera2D

#export (NodePath) camera
#func get_input():
#    # add these actions in Project Settings -> Input Map
#    #velocity = Vector2()
#	if Input.is_action_pressed('ui_page_down'):
#		Zoom+=0.1
#		print("Zoom down to "+zoom)
#	if Input.is_action_pressed('ui_page_up'):
#		Zoom-=0.1
#		print("Zoom up to "+zoom)

#func get_input():
#	if Input.is_action_pressed('ui_page_up'):
#		print("Zoom up to "+str($Camera2D.zoom))
#		$lifeCamera2D.zoom-=Vector2(0.1,0.1)
#		print("page up pressed")
#	if Input.is_action_pressed('ui_page_down'):
#		$lifeCamera2D.zoom+=Vector2(0.1,0.1)
#		print("Zoom down to "+str($Camera2D.zoom))
#		print("page down pressed")