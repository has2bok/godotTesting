extends Node
var scrollSpeed=500
var zoomSpeed=0.75
var cameraNode

func _ready():
#	set_process_input(true)
	cameraNode=get_node("../lifeCamera2D")

func _process(delta):
	if Input.is_action_pressed('ui_down'):
		cameraNode.position.y += scrollSpeed*delta
	if Input.is_action_pressed('ui_up'):
		cameraNode.position.y -= scrollSpeed*delta
	if Input.is_action_pressed('ui_left'):
		cameraNode.position.x-=scrollSpeed*delta
	if Input.is_action_pressed('ui_right'):
        cameraNode.position.x+=scrollSpeed*delta
	if Input.is_action_pressed('ui_page_up'):
		cameraNode.zoom+=Vector2(zoomSpeed*delta,zoomSpeed*delta)
	if Input.is_action_pressed('ui_page_down'):
		cameraNode.zoom-=Vector2(zoomSpeed*delta,zoomSpeed*delta)
		if cameraNode.zoom<=Vector2(0,0):
			cameraNode.zoom=Vector2(0,0)
	

#mouse scroll button only works in input function		
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
        # zoom in
			if event.button_index == BUTTON_WHEEL_UP:
				#zoom_pos = get_global_mouse_position()
				cameraNode.zoom+=Vector2(zoomSpeed,zoomSpeed)
			if event.button_index == BUTTON_WHEEL_DOWN:
				cameraNode.zoom-=Vector2(zoomSpeed,zoomSpeed)
				if cameraNode.zoom<=Vector2(0,0):
					cameraNode.zoom=Vector2(0,0)
				#zoom_pos = get_global_mouse_position()

    