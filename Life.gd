extends Node2D

var width=20
var height=20
var world = []
var rnd
var spawnThreshold=5
var Alive = preload("res://Alive.tscn")
var xSpacing#=get_viewport().size.x/width
var ySpacing#=get_viewport().size.y/height
var count
var spriteWidth
var spriteHeight

func _ready():
#	xSpacing=get_viewport().size.x/width
#	ySpacing=get_viewport().size.y/height
	randomize()
	var b = Alive.instance()
	spriteWidth=b.texture.get_size().x
	spriteHeight=b.texture.get_size().y
	xSpacing=spriteWidth
	ySpacing=spriteHeight
	print("srite width= "+str(spriteWidth))
	print("sprite height = "+str(spriteHeight))
#	add_child(b)
#	b.position = Vector2(00,00)
	
	#populate world with zeros
	for y in range(height):
	    world.append([])
	    world[y].resize(width)
	    for x in range(width):
	        world[y][x] = 0

	#populate with random ones.  skip very outside
	for y in range(1, int(height-1)):
		for x in range(1, int(width-1)):
			rnd=randi()%11+1
			if rnd<spawnThreshold:
				world[y][x]=1
				
	drawLives()
	
	
	
				
func drawLives():
	print("Drawing again")
	var x=0
	var y=0
	count=0
	for yi in range(int(height)):
		for xi in range(int(width)):
			if world[yi][xi]==1:
				#print("found a live one to draw")
				count+=1
				var b = Alive.instance()
				add_child(b)
				b.position.x=x
				b.position.y=y
				
				#x=xSpacing
				#b.position = Vector2(get_viewport().size.x/2,get_viewport().size.y/2)
				#print("yi = "+str(yi)+" y = "+str(y)+ " xi = "+str(xi)+" x = "+str(x))
				#print("drawn at y = "+str(b.position.y)+" x = "+str(b.position.x))
			x+=xSpacing
		y+=ySpacing
		x=0
#		get_parent().add_child(b)
				#screen.set_at((x, y), red)
	print("Count = "+str(count))
	#print("yspacing = "+str(ySpacing)+" xSpacing = "+str(xSpacing))
	#print("viewport y ="+str(get_viewport().size.y)+" viewport x = "+str(get_viewport().size.x))
	#return world
	
func get_input():
	if Input.is_action_pressed('ui_page_up'):
		print("Zoom up to "+str($Camera2D.zoom))
		$lifeCamera2D.zoom-=Vector2(0.1,0.1)
		print("page up pressed")
	if Input.is_action_pressed('ui_page_down'):
		$lifeCamera2D.zoom+=Vector2(0.1,0.1)
		print("Zoom down to "+str($Camera2D.zoom))
		print("page down pressed")
	