extends KinematicBody2D
export var speed=100
var velocity=Vector2()
var player
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
#player=get_node("/Main/Player")
	#velocity=Vector2()
#	player=get_node("../")
	#position=$Muzzle.position
	#velocity=player.velocity.normalized()*speed
#	move_and_collide(velocity)
	pass

func start(pos, dir):
    rotation = dir
    position = pos
    velocity = Vector2(speed, 0).rotated(rotation)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	move_and_collide(velocity * delta)
#	move_and_collide(velocity*delta)

func _physics_process(delta):
	move_and_collide(velocity*delta)