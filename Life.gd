extends Node2D

var width=30
var height=30
var world = []
var b=[]
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
	var temp=Alive.instance()
	spriteWidth=temp.texture.get_size().x
	spriteHeight=temp.texture.get_size().y
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
	#for f in range(0, b.size()):
	#	queue_free()
	
	for yi in range(int(height)):
		for xi in range(int(width)):
			if world[yi][xi]==1:
				#print("found a live one to draw")
				#count+=1
				b.append(Alive.instance())
				add_child(b[count])
				b[count].position.x=x
				b[count].position.y=y
				count+=1
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
	var speed =10
	if Input.is_action_pressed('ui_down'):
		$lifeCamera2D.position.y += speed
	if Input.is_action_pressed('ui_up'):
		$lifeCamera2D.position.y -= speed
	if Input.is_action_pressed('ui_left'):
		$lifeCamera2D.position.x-=speed
	if Input.is_action_pressed('ui_right'):
        $lifeCamera2D.position.x+=speed
	if Input.is_action_pressed('ui_page_up'):
		print("Zoom up to "+str($lifeCamera2D.zoom))
		$lifeCamera2D.zoom-=Vector2(0.1,0.1)
		print("page up pressed")
	if Input.is_action_pressed('ui_page_down'):
		$lifeCamera2D.zoom+=Vector2(0.1,0.1)
		print("Zoom down to "+str($lifeCamera2D.zoom))
		print("page down pressed")

	
func countNeighbours(x,y):
	var liveCount=0
	for f in range(-1,1):
		for i in range(-1,1):
			if world[(y+f)][(x+i)]==1:
				liveCount+=1
	return liveCount
	
func processLife():
	#try this timer
	#yield(get_tree().create_timer(50.5),"timeout")
	#clear array of sprites
	#for f in range(0, b.size()):
	#	queue_free()
	var live=0
	for y in range(1, int(height-1)):
		for x in range(1, int(width-1)):
			#if world[x*y]==1:
				#check how many live neighbours
			live=countNeighbours(x,y)
			print ("live = "+str(live))
			if world[y][x]==1:
				if live<2:
					world[y][x]=0
					print("killing one less than 2")
				if live>3:
					world[y][x]=0
					print("killing one greater than 3")
			if world[y][x]==0:
				if live==3:
					world[y][x]=1
					print("create greater than 3")
	
	
	
	#func _physics_process(delta):
func _process(delta):
	get_input()
	#processLife()
	drawLives()
	