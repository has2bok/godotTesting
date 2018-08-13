extends Node
onready var enemy= preload("res://Enemy.tscn")
var enemies = []
var maxEnemies=5
var screenSize



func _ready():
	print("Starting")
	randomize()
	enemies.resize(maxEnemies)
	screenSize=get_viewport_rect().size
	for i in range(maxEnemies):
		enemies[i]=enemy.instance()
	#	add_child(enemies[i])
		enemies[i].position.x=randi()%int(screenSize.x+1)
		enemies[i].position.y=randi()%int(screenSize.y+1)


func _process(delta):
#	update_player(delta)
#	for i in range(enemies.size()):
#		move_enemy(enemies[i], delta)
	pass
	

	