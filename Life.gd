extends Node

var mySeedDefault="Aphanumeric characters"
var mySeed=mySeedDefault
var width=80
var height=80
var world=[]
var b=[]
var rnd
var spawnThresholdDefault=50
var spawnThreshold=spawnThresholdDefault
var Alive = preload("res://Alive.tscn")
var xSpacing#=get_viewport().size.x/width
var ySpacing#=get_viewport().size.y/height
var count
var spriteWidth
var spriteHeight
var temp=0
var iter=0
var pause=false

func _ready():
#	OS.set_window_position(OS.get_screen_size()-OS.get_window_size())
	get_node("lifeCamera2D").zoom=Vector2(4,4)
	get_node("CanvasLayer/SeedLabel").text=mySeed
	get_node("CanvasLayer/SpawnLabel").text=str(spawnThreshold)
	#mySeed=get_node("CanvasLayer/SeedLabel").text
#	xSpacing=get_viewport().size.x/width
#	ySpacing=get_viewport().size.y/height
#	randomize()
	var tempSprite=Alive.instance()
	spriteWidth=tempSprite.texture.get_size().x
	spriteHeight=tempSprite.texture.get_size().y
	xSpacing=spriteWidth
	ySpacing=spriteHeight
	

#if pause is true then slow down
	if pause==true:
		var timer = Timer.new()
		timer.connect("timeout",self,"_on_timer_timeout") 
		timer.set_wait_time( 2 )
#timeout is what says in docs, in signals
#self is who respond to the callback
#_on_timer_timeout is the callback, can have any name
		add_child(timer) #to process
		timer.start() #to start

###	randomPop()
###	drawLives()
	reset()
	
func reset():
	get_node("CanvasLayer/SeedLabel").text=mySeed
	get_node("CanvasLayer/SpawnLabel").text=str(spawnThreshold)
	world=[]
	seed(mySeed.hash())
#	seed(1234)
#	print("Start random numbers")
#	for y in range(10):
#		print(str(randi()%11+1))
	#populate world with zeros
	for x in range(width):
    	world.append([])
    	for y in range(height):
        	world[x].append(0)
	randomPop()
	drawLives()
	
func randomPop():
		#populate with random ones.  skip very outside
	for y in range(1, int(height-1)):
		for x in range(1, int(width-1)):
			rnd=randi()%100+1
			if rnd<int(spawnThreshold):
				world[y][x]=1
	
func drawTest():
#	for f in b:
#		print("creating b[f] "+str(f))
#		b.append(Alive.instance())
#		b[f].position.x=100*f
#		b[f].position.y=10*f
#		add_child(b[f])
	
	b.append(Alive.instance())
	b[0].position.x=100
	b[0].position.y=100
	add_child(b[0])
	b.append(Alive.instance())
	b[1].position.x=130
	b[1].position.y=130
	add_child(b[1])
	#drawLives()
	
func arrayTest():
	world[0][0]=1
	world[0][2]=1
	world[2][0]=1
	world[2][2]=1
	world[0][1]=0

func testMove():
	for y in range(0, int(height)):
		for x in range(0, int(width)):
			#if world[x*y]==1:
				#check how many live neighbours
#			live=countNeighbours(x,y)
#			print ("live = "+str(live))
#			if world[y][x]==0:
#				world[y][x]=1
#			else:
#				world[y][x]=0
			print(str(y)+str(x)+str(world[y][x]))
			world[y][x]=1-world[y][x]
	
				
func drawLives():
#	print("Drawing again")
	var x=0
	var y=0
	count=0
	for f in range(0, b.size()):
#		queue_free()
		remove_child(b[0])
		b.remove(0)
#	print("b size is "+str(b.size()))
		
	
#	b.clear()
	for yi in range(int(height)):
		for xi in range(int(width)):
			if world[yi][xi]==1:
				#print("found a live one to draw")
				#count+=1
				b.append(Alive.instance())
				b[count].position.x=x
				b[count].position.y=y
				add_child(b[count])
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
#	print("Count = "+str(count))
#	print("b size is "+str(b.size()))

	#print("yspacing = "+str(ySpacing)+" xSpacing = "+str(xSpacing))
	#print("viewport y ="+str(get_viewport().size.y)+" viewport x = "+str(get_viewport().size.x))
	#return world
	


	
func countNeighbours(x,y):
	var liveCount=0
	for f in range(-1,2):
		for i in range(-1,2):
			if world[(y+f)][(x+i)]==1:
				liveCount+=1
	return liveCount-1
	
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
#			print ("live = "+str(live))
			if world[y][x]==1:
				if live<2:
					world[y][x]=0
#					print("killing one less than 2")
				if live>3:
					world[y][x]=0
#					print("killing one greater than 3")
			if world[y][x]==0:
				if live==3:
					world[y][x]=1
#					print("create greater than 3")
					

func waitForSpaceBar():
	var wait=true
	while(wait==true):
		if Input.is_action_pressed('ui_accept'):
			print("Space bar pressed")
			wait=false

func _on_timer_timeout():
#	testMove()
	processLife()
	drawLives()


func _process(delta):

	if pause==false:
		processLife()
		drawLives()
	

func _on_RestartButton_pressed():
#	get_tree().reload_current_scene()
	mySeed=get_node("CanvasLayer/SeedInput").text
	if mySeed=="":
		mySeed=mySeedDefault
	spawnThreshold=get_node("CanvasLayer/SpawnInput").text
	spawnThreshold=int(spawnThreshold)
	if int(spawnThreshold)<1 or int(spawnThreshold)>100:
		spawnThreshold=spawnThresholdDefault
		get_node("CanvasLayer/SpawnInput").text=str(spawnThreshold)
	reset()



func _on_RandomSeedButton_pressed():
		mySeed=randi()
		get_node("CanvasLayer/SeedInput").text=str(mySeed)
		