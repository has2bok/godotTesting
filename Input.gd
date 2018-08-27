extends Node
var speed=10
var cameraNode

func _ready():
	cameraNode=get_node("../lifeCamera2D")

func _process(delta):
	if Input.is_action_pressed('ui_down'):
		cameraNode.position.y += speed
	if Input.is_action_pressed('ui_up'):
		cameraNode.position.y -= speed
	if Input.is_action_pressed('ui_left'):
		cameraNode.position.x-=speed
	if Input.is_action_pressed('ui_right'):
        cameraNode.position.x+=speed
	if Input.is_action_pressed('ui_page_up'):
		cameraNode.zoom+=Vector2(0.1,0.1)
		print("Zoom up to "+str($"../lifeCamera2D".zoom))
	if Input.is_action_pressed('ui_page_down'):
		cameraNode.zoom-=Vector2(0.1,0.1)
		if cameraNode.zoom<=Vector2(0,0):
			cameraNode.zoom=Vector2(0,0)
		print("Zoom down to "+str($"../lifeCamera2D".zoom))
