extends Node2D
export var speed=20
var player
var velocity=Vector2()

func _ready():
	player=get_node("../Player")
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	velocity=Vector2()
	velocity+=((player.position-position).normalized())*speed
	move_and_collide(velocity * delta)