extends Node2D
onready var bullets= preload("res://Bullet.tscn")
var bullet
export var speed=30
var velocity = Vector2()
var direction
var rotSpeed=0.1

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	if Input.is_action_pressed("ui_left"): position.x+=-speed*delta
#	if Input.is_action_pressed("ui_right"): position.x+=speed*delta
#	if Input.is_action_pressed("ui_up"): position.y+=-speed*delta
#	if Input.is_action_pressed("ui_down"): position.y+=speed*delta

func _physics_process(delta):
	velocity=Vector2()
	direction=0
	if Input.is_action_pressed('ui_right'):
		rotation+=rotSpeed
		direction=1
	if Input.is_action_pressed('ui_left'):
		rotation -= rotSpeed
		direction=3
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
		direction=2
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
		direction=4
	if Input.is_action_pressed('ui_select'):
		bullet=bullets.instance()
		bullet.start($Muzzle.global_position, rotation)
		get_parent().add_child(bullet)
			
	velocity = velocity.normalized() * speed
	move_and_collide(velocity * delta)